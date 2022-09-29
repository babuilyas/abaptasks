class ZTASK2_CL_CP_INBDLV_TEST definition
  public
  final
  create public .

  public section.

    interfaces IF_OO_ADT_CLASSRUN .
  protected section.
  private section.
endclass.

class ZTASK2_CL_CP_INBDLV_TEST implementation.
  method IF_OO_ADT_CLASSRUN~MAIN.

    types: begin of ts_A_InbDeliveryHeader,
             Supplier             type    String,
             DeliveryDocument     type    String,
             DeliveryDate         type    Date,
             CREATEDBYUSER        type STRING,
             DOCUMENTDATE         type DATE,
             DeliveryDocumentType type STRING,
           end of TS_A_INBDELIVERYHEADER.

    types: tt_A_InbDeliveryHeader type standard table of TS_A_INBDELIVERYHEADER.

    data: lt_A_InbDeliveryHeader type TT_A_INBDELIVERYHEADER,
          LO_CLIENT_PROXY        type ref to /IWBEP/IF_CP_CLIENT_PROXY,
          LO_READ_REQUEST        type ref to /IWBEP/IF_CP_REQUEST_READ_LIST,
          LO_READ_RESPONSE       type ref to /IWBEP/IF_CP_RESPONSE_READ_LST.

    data LV_RELATIVE_SERVICE_ROOT type STRING.

    LV_RELATIVE_SERVICE_ROOT = |/10/API_INBOUND_DELIVERY_SRV/|.

    try.
        "throws an exception if service document cannot be read

        " Using SM59 destination for HTTP client object
        CL_HTTP_CLIENT=>CREATE_BY_DESTINATION(
          exporting
            DESTINATION = 'ODATA_INB_DLV'
          importing
            CLIENT      = data(LO_HTTP_CLIENT)
          exceptions
            others      = 0 ).

        if SY-SUBRC <> 0.
          OUT->WRITE( 'error create by http destination').
          exit.
        endif.

        LO_HTTP_CLIENT->REQUEST->IF_HTTP_ENTITY~SET_HEADER_FIELDS(
        FIELDS = value #(
        ( NAME = 'accept' VALUE = 'application/json' )
        ( NAME = 'accept-encoding' VALUE = '*' )
*                ( NAME = 'content-type' VALUE = 'application/json' )
        ) ).

        LO_CLIENT_PROXY = /IWBEP/CL_CP_CLIENT_PROXY_FACT=>CREATE_v2_REMOTE_PROXY(
           IO_HTTP_CLIENT = LO_HTTP_CLIENT
           IS_PROXY_MODEL_KEY = value #(
           REPOSITORY_ID = /IWBEP/IF_CP_REGISTRY_TYPES=>GCS_REPOSITORY_ID-DEFAULT
           PROXY_MODEL_ID = 'ZTASK2_CL_CP_MDL_INBDLV'
           PROXY_MODEL_VERSION = 0001 )
           IV_RELATIVE_SERVICE_ROOT = LV_RELATIVE_SERVICE_ROOT ).

        " 'SALESORDER' is the ABAP internal name of the entityset of the V4 model

        LO_READ_REQUEST = LO_CLIENT_PROXY->CREATE_RESOURCE_FOR_ENTITY_SET( 'A_INBDELIVERYHEADER' )->CREATE_REQUEST_FOR_READ( ).

        data TT type /IWBEP/IF_CP_RUNTIME_TYPES=>TY_T_PROPERTY_PATH .
*        append 'DELIVERYDOCUMENTTYPE' to TT.
        append 'SUPPLIER' to TT.
        append 'DELIVERYDOCUMENT' to TT.
*        append 'DELIVERYDATE' to TT.
*        append 'CREATEDBYUSER' to TT.
*        append  'DOCUMENTDATE' to TT.
        LO_READ_REQUEST->SET_SELECT_PROPERTIES( IT_SELECT_PROPERTY =  TT ).

*        LO_READ_REQUEST->SET_TOP( 5 ) .

        " filter 1
        data LT_RANGE type range of STRING.
        LT_RANGE = value #( ( OPTION = 'EQ' SIGN = 'I' LOW = '2000000001' ) ).
        data(IO_FILTER) = LO_READ_REQUEST->CREATE_FILTER_FACTORY(  )->CREATE_BY_RANGE(
        IV_PROPERTY_PATH = 'SUPPLIER'
        IT_RANGE = LT_RANGE ).
        LO_READ_REQUEST->SET_FILTER( IO_FILTER ).

        " filter 2
        data LT_RANGE2 type range of D.
        LT_RANGE2 = value #( ( OPTION = 'GE' SIGN = 'I' LOW = '20210801' ) ).
        data(IO_FILTER2) = LO_READ_REQUEST->CREATE_FILTER_FACTORY(  )->CREATE_BY_RANGE(
        IV_PROPERTY_PATH = 'CREATIONDATE'
        IT_RANGE = LT_RANGE2 ).
*        LO_READ_REQUEST->SET_FILTER( IO_FILTER2 ).



*         LO_READ_REQUEST->REQUEST_COUNT( ) .

        LO_READ_RESPONSE = LO_READ_REQUEST->EXECUTE( ).

        " Retrieve the business data
        LO_READ_RESPONSE->GET_BUSINESS_DATA( importing ET_BUSINESS_DATA = lt_A_InbDeliveryHeader ).

        OUT->WRITE( LT_A_INBDELIVERYHEADER ).
        " Todo: 1: Filter 1
        " Incoming row is 1 expected 3.

        " Todo: 2: Filter 2
        " Incoming row expected but none found.


      catch /IWBEP/CX_CP_REMOTE into data(LX_CP_REMOTE).
        " Error handling
        OUT->WRITE( LX_CP_REMOTE->GET_LONGTEXT(  ) ).
      catch /IWBEP/CX_GATEWAY into data(LX_GATEWAY).
        " Error Handling
        OUT->WRITE( LX_GATEWAY->GET_LONGTEXT(  ) ).
    endtry.



  endmethod.

endclass.
