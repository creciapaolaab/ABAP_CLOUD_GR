@EndUserText.label: 'Consuption - Travel Root'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define root view entity Z_C_TRAVEL2914 
provider contract transactional_query
as projection on Z_I_TRAVEL2914
{
    key TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _Agency,
    _Booking: redirected to composition child Z_C_BOOK2914,
    _Currency,
    _Customer
}
