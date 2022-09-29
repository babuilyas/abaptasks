class ZTASK2_CL_CP_MDL_INBDLV definition
  public
  inheriting from /IWBEP/CL_V4_ABS_MODEL_PROV
  final
  create public .

  public section.
    methods /IWBEP/IF_V4_MP_BASIC~DEFINE redefinition.
  protected section.
  private section.
    methods DEFINE_A_INBDELIVERYHEADERTYPE
      importing
        MODEL type ref to /IWBEP/IF_V4_MED_MODEL
      raising
        /IWBEP/CX_MGW_MED_EXCEPTION .

    types:
      begin of TS_A_INBDELIVERYHEADERTYPE,
        ACTUALDELIVERYROUTE            type C length 6,
        ACTUALGOODSMOVEMENTDATE        type d,
        ACTUALGOODSMOVEMENTTIME        type T,
        BILLINGDOCUMENTDATE            type d,
        BILLOFLADING                   type C length 35,
        COMPLETEDELIVERYISDEFINED      type STRING,
        CONFIRMATIONTIME               type T,
        CREATEDBYUSER                  type C length 12,
        CREATIONDATE                   type d,
        CREATIONTIME                   type T,
        CUSTOMERGROUP                  type C length 2,
        DELIVERYBLOCKREASON            type C length 2,
        DELIVERYDATE                   type d,
        DELIVERYDOCUMENT               type C length 10,
        DELIVERYDOCUMENTBYSUPPLIER     type C length 35,
        DELIVERYDOCUMENTTYPE           type STRING,
        DELIVERYISINPLANT              type STRING,
        DELIVERYPRIORITY               type C length 2,
        DELIVERYTIME                   type T,
        DELIVERYVERSION                type C length 4,
        DEPRECIATIONPERCENTAGE         type P length 3 decimals 2,
        DISTRSTATUSBYDECENTRALIZEDWRHS type C length 1,
        DOCUMENTDATE                   type d,
        EXTERNALIDENTIFICATIONTYPE     type C length 1,
        EXTERNALTRANSPORTSYSTEM        type C length 5,
        FACTORYCALENDARBYCUSTOMER      type C length 2,
        GOODSISSUEORRECEIPTSLIPNUMBER  type C length 10,
        GOODSISSUETIME                 type T,
        HANDLINGUNITINSTOCK            type C length 1,
        HDRGENERALINCOMPLETIONSTATUS   type C length 1,
        HDRGOODSMVTINCOMPLETIONSTATUS  type C length 1,
        HEADERBILLGINCOMPLETIONSTATUS  type C length 1,
        HEADERBILLINGBLOCKREASON       type C length 2,
        HEADERDELIVINCOMPLETIONSTATUS  type C length 1,
        HEADERGROSSWEIGHT              type P length 8 decimals 3,
        HEADERNETWEIGHT                type P length 8 decimals 3,
        HEADERPACKINGINCOMPLETIONSTS   type C length 1,
        HEADERPICKGINCOMPLETIONSTATUS  type C length 1,
        HEADERVOLUME                   type P length 8 decimals 3,
        HEADERVOLUMEUNIT               type C length 3,
        HEADERWEIGHTUNIT               type C length 3,
        INCOTERMSCLASSIFICATION        type C length 3,
        INCOTERMSTRANSFERLOCATION      type C length 28,
        INTERCOMPANYBILLINGDATE        type d,
        INTERNALFINANCIALDOCUMENT      type C length 10,
        ISDELIVERYFORSINGLEWAREHOUSE   type C length 1,
        ISEXPORTDELIVERY               type C length 1,
        LASTCHANGEDATE                 type d,
        LASTCHANGEDBYUSER              type C length 12,
        LOADINGDATE                    type d,
        LOADINGPOINT                   type C length 2,
        LOADINGTIME                    type T,
        MEANSOFTRANSPORT               type C length 20,
        MEANSOFTRANSPORTREFMATERIAL    type C length 40,
        MEANSOFTRANSPORTTYPE           type C length 4,
        ORDERCOMBINATIONISALLOWED      type STRING,
        ORDERID                        type C length 12,
        OVERALLDELIVCONFSTATUS         type C length 1,
        OVERALLDELIVRELTDBILLGSTATUS   type C length 1,
        OVERALLGOODSMOVEMENTSTATUS     type C length 1,
        OVERALLINTCOBILLINGSTATUS      type C length 1,
        OVERALLPACKINGSTATUS           type C length 1,
        OVERALLPICKINGCONFSTATUS       type C length 1,
        OVERALLPICKINGSTATUS           type C length 1,
        OVERALLPROOFOFDELIVERYSTATUS   type C length 1,
        OVERALLSDPROCESSSTATUS         type C length 1,
        OVERALLWAREHOUSEACTIVITYSTATUS type C length 1,
        OVRLITMDELIVINCOMPLETIONSTS    type C length 1,
        OVRLITMGDSMVTINCOMPLETIONSTS   type C length 1,
        OVRLITMGENERALINCOMPLETIONSTS  type C length 1,
        OVRLITMPACKINGINCOMPLETIONSTS  type C length 1,
        OVRLITMPICKINGINCOMPLETIONSTS  type C length 1,
        PAYMENTGUARANTEEPROCEDURE      type C length 6,
        PICKEDITEMSLOCATION            type C length 20,
        PICKINGDATE                    type d,
        PICKINGTIME                    type T,
        PLANNEDGOODSISSUEDATE          type d,
        PROOFOFDELIVERYDATE            type d,
        PROPOSEDDELIVERYROUTE          type C length 6,
        RECEIVINGPLANT                 type C length 4,
        ROUTESCHEDULE                  type C length 10,
        SALESDISTRICT                  type C length 6,
        SALESOFFICE                    type C length 4,
        SALESORGANIZATION              type C length 4,
        SDDOCUMENTCATEGORY             type C length 4,
        SHIPMENTBLOCKREASON            type C length 2,
        SHIPPINGCONDITION              type C length 2,
        SHIPPINGPOINT                  type C length 4,
        SHIPPINGTYPE                   type C length 2,
        SHIPTOPARTY                    type C length 10,
        SOLDTOPARTY                    type C length 10,
        SPECIALPROCESSINGCODE          type C length 4,
        STATISTICSCURRENCY             type C length 5,
        SUPPLIER                       type C length 10,
        TOTALBLOCKSTATUS               type C length 1,
        TOTALCREDITCHECKSTATUS         type C length 1,
        TOTALNUMBEROFPACKAGE           type C length 5,
        TRANSACTIONCURRENCY            type C length 5,
        TRANSPORTATIONGROUP            type C length 4,
        TRANSPORTATIONPLANNINGDATE     type D,
        TRANSPORTATIONPLANNINGSTATUS   type C length 1,
        TRANSPORTATIONPLANNINGTIME     type T,
        UNLOADINGPOINTNAME             type C length 25,
        WAREHOUSE                      type C length 3,
        WAREHOUSEGATE                  type C length 3,
        WAREHOUSESTAGINGAREA           type C length 10,
      end of TS_A_INBDELIVERYHEADERTYPE .
    types:
  TT_A_INBDELIVERYHEADERTYPE type standard table of TS_A_INBDELIVERYHEADERTYPE .

    data lS_A_INBDELIVERYHEADERTYPE type TS_A_INBDELIVERYHEADERTYPE.
endclass.



class ZTASK2_CL_CP_MDL_INBDLV implementation.
  method /IWBEP/IF_V4_MP_BASIC~DEFINE.
    DEFINE_A_INBDELIVERYHEADERTYPE( IO_MODEL ).
    IO_MODEL->SET_SCHEMA_NAMESPACE( 'API_INBOUND_DELIVERY_SRV' ).
  endmethod.

  method DEFINE_A_INBDELIVERYHEADERTYPE.

    data:
      LO_ANNOTATION   type ref to /IWBEP/IF_MGW_ODATA_ANNOTATION, "#EC NEEDED
*        lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                "#EC NEEDED
      LO_COMPLEX_TYPE type ref to /IWBEP/IF_MGW_ODATA_CMPLX_TYPE, "#EC NEEDED
      LO_PROPERTY     type ref to /IWBEP/IF_V4_MED_ELEMENT=>TY_E_MED_EDM_NAME. "#EC NEEDED
*        lo_entity_set     type ref to /iwbep/if_mgw_odata_entity_set.                "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - A_InbDeliveryHeaderType
***********************************************************************************************************************************
   data(LO_ENTITY_TYPE) = MODEL->CREATE_ENTITY_TYPE_BY_STRUCT(
                      exporting
                        IV_ENTITY_TYPE_NAME          = 'A_INBDELIVERYHEADERTYPE'
                        IS_STRUCTURE                 = LS_A_INBDELIVERYHEADERTYPE
                        IV_ADD_CONV_TO_PRIM_PROPS    = ABAP_TRUE
                        IV_ADD_F4_HELP_TO_PRIM_PROPS = ABAP_TRUE
                        IV_GEN_PRIM_PROPS            = ABAP_TRUE ).

    LO_ENTITY_TYPE->SET_EDM_NAME( IV_EDM_NAME = 'A_InbDeliveryHeaderType' ).

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    LO_ENTITY_TYPE->GET_PRIMITIVE_PROPERTIES( importing ET_PROPERTY = data(LT_PRIMITIVE_PROPERTIES) ).

    loop at LT_PRIMITIVE_PROPERTIES into data(LO_PRIMITIVE_PROPERTY).
      LO_PRIMITIVE_PROPERTY->SET_EDM_NAME( TO_MIXED( VAL = LO_PRIMITIVE_PROPERTY->GET_INTERNAL_NAME( ) ) ).
    endloop.

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    LO_PRIMITIVE_PROPERTY = LO_ENTITY_TYPE->GET_PRIMITIVE_PROPERTY( 'DELIVERYDOCUMENT' ).
    LO_PRIMITIVE_PROPERTY->SET_IS_KEY( ).
    LO_PRIMITIVE_PROPERTY->SET_EDM_NAME( 'DeliveryDocument' ).


    "Set edm names
    data LT_FIELDNAMES type table of /IWBEP/IF_V4_MED_ELEMENT=>TY_E_MED_EDM_NAME.
    data IV_PROPERTY_NAME type /IWBEP/IF_V4_MED_ELEMENT=>TY_E_MED_EDM_NAME .

***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

    append 'ActualDeliveryRoute' to LT_FIELDNAMES.
    append  'ActualDeliveryRoute' to LT_FIELDNAMES.
    append 'ActualGoodsMovementDate' to LT_FIELDNAMES.
    append 'ActualGoodsMovementTime' to LT_FIELDNAMES.
    append 'BillingDocumentDate' to LT_FIELDNAMES.
    append 'BillOfLading' to LT_FIELDNAMES.
    append 'CompleteDeliveryIsDefined' to LT_FIELDNAMES.
    append 'ConfirmationTime' to LT_FIELDNAMES.
    append 'CreatedByUser' to LT_FIELDNAMES.
    append 'CreationDate' to LT_FIELDNAMES.
    append 'CreationTime' to LT_FIELDNAMES.
    append 'CustomerGroup' to LT_FIELDNAMES.
    append 'DeliveryBlockReason' to LT_FIELDNAMES.
    append 'DeliveryDate' to LT_FIELDNAMES.
    append 'DeliveryDocument' to LT_FIELDNAMES.
    append 'DeliveryDocumentBySupplier' to LT_FIELDNAMES.
    append 'DeliveryDocumentType' to LT_FIELDNAMES.
    append 'DeliveryIsInPlant' to LT_FIELDNAMES.
    append 'DeliveryPriority' to LT_FIELDNAMES.
    append 'DeliveryTime' to LT_FIELDNAMES.
    append 'DeliveryVersion' to LT_FIELDNAMES.
    append 'DepreciationPercentage' to LT_FIELDNAMES.
    append 'DistrStatusByDecentralizedWrhs' to LT_FIELDNAMES.
    append 'DocumentDate' to LT_FIELDNAMES.
    append 'ExternalIdentificationType' to LT_FIELDNAMES.
    append 'ExternalTransportSystem' to LT_FIELDNAMES.
    append 'FactoryCalendarByCustomer' to LT_FIELDNAMES.
    append 'GoodsIssueOrReceiptSlipNumber' to LT_FIELDNAMES.
    append 'GoodsIssueTime' to LT_FIELDNAMES.
    append 'HandlingUnitInStock' to LT_FIELDNAMES.
    append 'HdrGeneralIncompletionStatus' to LT_FIELDNAMES.
    append 'HdrGoodsMvtIncompletionStatus' to LT_FIELDNAMES.
    append 'HeaderBillgIncompletionStatus' to LT_FIELDNAMES.
    append 'HeaderBillingBlockReason' to LT_FIELDNAMES.
    append 'HeaderDelivIncompletionStatus' to LT_FIELDNAMES.
    append 'HeaderGrossWeight' to LT_FIELDNAMES.
    append 'HeaderNetWeight' to LT_FIELDNAMES.
    append 'HeaderPackingIncompletionSts' to LT_FIELDNAMES.
    append 'HeaderPickgIncompletionStatus' to LT_FIELDNAMES.
    append 'HeaderVolume' to LT_FIELDNAMES.
    append 'HeaderVolumeUnit' to LT_FIELDNAMES.
    append 'HeaderWeightUnit' to LT_FIELDNAMES.
    append 'IncotermsClassification' to LT_FIELDNAMES.
    append 'IncotermsTransferLocation' to LT_FIELDNAMES.
    append 'IntercompanyBillingDate' to LT_FIELDNAMES.
    append 'InternalFinancialDocument' to LT_FIELDNAMES.
    append 'IsDeliveryForSingleWarehouse' to LT_FIELDNAMES.
    append 'IsExportDelivery' to LT_FIELDNAMES.
    append 'LastChangeDate' to LT_FIELDNAMES.
    append 'LastChangedByUser' to LT_FIELDNAMES.
    append 'LoadingDate' to LT_FIELDNAMES.
    append 'LoadingPoint' to LT_FIELDNAMES.
    append 'LoadingTime' to LT_FIELDNAMES.
    append 'MeansOfTransport' to LT_FIELDNAMES.
    append 'MeansOfTransportRefMaterial' to LT_FIELDNAMES.
    append 'MeansOfTransportType' to LT_FIELDNAMES.
    append 'OrderCombinationIsAllowed' to LT_FIELDNAMES.
    append 'OrderID' to LT_FIELDNAMES.
    append 'OverallDelivConfStatus' to LT_FIELDNAMES.
    append 'OverallDelivReltdBillgStatus' to LT_FIELDNAMES.
    append 'OverallGoodsMovementStatus' to LT_FIELDNAMES.
    append 'OverallIntcoBillingStatus' to LT_FIELDNAMES.
    append 'OverallPackingStatus' to LT_FIELDNAMES.
    append 'OverallPickingConfStatus' to LT_FIELDNAMES.
    append 'OverallPickingStatus' to LT_FIELDNAMES.
    append 'OverallProofOfDeliveryStatus' to LT_FIELDNAMES.
    append 'OverallSDProcessStatus' to LT_FIELDNAMES.
    append 'OverallWarehouseActivityStatus' to LT_FIELDNAMES.
    append 'OvrlItmDelivIncompletionSts' to LT_FIELDNAMES.
    append 'OvrlItmGdsMvtIncompletionSts' to LT_FIELDNAMES.
    append 'OvrlItmGeneralIncompletionSts' to LT_FIELDNAMES.
    append 'OvrlItmPackingIncompletionSts' to LT_FIELDNAMES.
    append 'OvrlItmPickingIncompletionSts' to LT_FIELDNAMES.
    append 'PaymentGuaranteeProcedure' to LT_FIELDNAMES.
    append 'PickedItemsLocation' to LT_FIELDNAMES.
    append 'PickingDate' to LT_FIELDNAMES.
    append 'PickingTime' to LT_FIELDNAMES.
    append 'PlannedGoodsIssueDate' to LT_FIELDNAMES.
    append 'ProofOfDeliveryDate' to LT_FIELDNAMES.
    append 'ProposedDeliveryRoute' to LT_FIELDNAMES.
    append 'ReceivingPlant' to LT_FIELDNAMES.
    append 'RouteSchedule' to LT_FIELDNAMES.
    append 'SalesDistrict' to LT_FIELDNAMES.
    append 'SalesOffice' to LT_FIELDNAMES.
    append 'SalesOrganization' to LT_FIELDNAMES.
    append 'SDDocumentCategory' to LT_FIELDNAMES.
    append 'ShipmentBlockReason' to LT_FIELDNAMES.
    append 'ShippingCondition' to LT_FIELDNAMES.
    append 'ShippingPoint' to LT_FIELDNAMES.
    append 'ShippingType' to LT_FIELDNAMES.
    append 'ShipToParty' to LT_FIELDNAMES.
    append 'SoldToParty' to LT_FIELDNAMES.
    append 'SpecialProcessingCode' to LT_FIELDNAMES.
    append 'StatisticsCurrency' to LT_FIELDNAMES.
    append 'Supplier' to LT_FIELDNAMES.
    append 'TotalBlockStatus' to LT_FIELDNAMES.
    append 'TotalCreditCheckStatus' to LT_FIELDNAMES.
    append 'TotalNumberOfPackage' to LT_FIELDNAMES.
    append 'TransactionCurrency' to LT_FIELDNAMES.
    append 'TransportationGroup' to LT_FIELDNAMES.
    append 'TransportationPlanningDate' to LT_FIELDNAMES.
    append 'TransportationPlanningStatus' to LT_FIELDNAMES.
    append 'TransportationPlanningTime' to LT_FIELDNAMES.
    append 'UnloadingPointName' to LT_FIELDNAMES.
    append 'Warehouse' to LT_FIELDNAMES.
    append 'WarehouseGate' to LT_FIELDNAMES.
    append 'WarehouseStagingArea' to LT_FIELDNAMES.


    loop at LT_FIELDNAMES into data(LS_FIELDNAME).
      LO_PRIMITIVE_PROPERTY = LO_ENTITY_TYPE->GET_PRIMITIVE_PROPERTY( TO_UPPER( LS_FIELDNAME ) ).
      LO_PRIMITIVE_PROPERTY->SET_EDM_NAME( LS_FIELDNAME ).
      case LS_FIELDNAME.
        when 'LastChangeDate'.
          LO_PRIMITIVE_PROPERTY->SET_IS_NULLABLE( ).
      endcase.
    endloop.

***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
    data(LO_ENTITY_SET) = LO_ENTITY_TYPE->CREATE_ENTITY_SET( 'A_INBDELIVERYHEADER' ).
    LO_ENTITY_SET->SET_EDM_NAME( 'A_InbDeliveryHeader' ).
  endmethod.


endclass.
