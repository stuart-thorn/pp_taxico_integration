# Documentation for PP – Member API

<a name="documentation-for-api-endpoints"></a>
## Documentation for API Endpoints

All URIs are relative to *https://api.pp.example.com/mem/v1*

| Class | Method | HTTP request | Description |
|------------ | ------------- | ------------- | -------------|
| *DefaultApi* | [**flightBookingsMemberGet**](Apis/DefaultApi.md#flightbookingsmemberget) | **GET** /flightBookings/member | Get member's flight bookings |
*DefaultApi* | [**flightBookingsTaxiCoClientGet**](Apis/DefaultApi.md#flightbookingstaxicoclientget) | **GET** /flightBookings/taxiCoClient | Get bookings by Taxico customer ID |


<a name="documentation-for-models"></a>
## Documentation for Models

 - [MemberFlightBooking](./Models/MemberFlightBooking.md)
 - [PartnerFlightBooking](./Models/PartnerFlightBooking.md)
 - [_flightBookings_member_get_200_response](./Models/_flightBookings_member_get_200_response.md)
 - [_flightBookings_taxiCoClient_get_200_response](./Models/_flightBookings_taxiCoClient_get_200_response.md)


<a name="documentation-for-authorization"></a>
## Documentation for Authorization

<a name="BearerAuth"></a>
### BearerAuth

- **Type**: HTTP Bearer Token authentication (JWT)

