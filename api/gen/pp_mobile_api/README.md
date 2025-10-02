# Documentation for PP Mobile API (BFF)

<a name="documentation-for-api-endpoints"></a>
## Documentation for API Endpoints

All URIs are relative to *https://api.pp.example.com*

| Class | Method | HTTP request | Description |
|------------ | ------------- | ------------- | -------------|
| *DefaultApi* | [**bookRide**](Apis/DefaultApi.md#bookride) | **POST** /bookRide | Submit a taxi booking request linked to a flight |
*DefaultApi* | [**getBookingsList**](Apis/DefaultApi.md#getbookingslist) | **GET** /bookingsList | Get list of pending flights with related taxi data |
*DefaultApi* | [**getRideDetails**](Apis/DefaultApi.md#getridedetails) | **GET** /rideDetails | Get ride details and journey timing for a flight |


<a name="documentation-for-models"></a>
## Documentation for Models

 - [AirportDropoff](./Models/AirportDropoff.md)
 - [BookRideRequest](./Models/BookRideRequest.md)
 - [BookRideResponse](./Models/BookRideResponse.md)
 - [BookingSummary](./Models/BookingSummary.md)
 - [BookingSummary_taxi](./Models/BookingSummary_taxi.md)
 - [Error](./Models/Error.md)
 - [ExistingRide](./Models/ExistingRide.md)
 - [Flight](./Models/Flight.md)
 - [GeoAddress](./Models/GeoAddress.md)
 - [RideDetailsResponse](./Models/RideDetailsResponse.md)
 - [RideOption](./Models/RideOption.md)
 - [RideOption_estimatedFare](./Models/RideOption_estimatedFare.md)
 - [getBookingsList_200_response](./Models/getBookingsList_200_response.md)


<a name="documentation-for-authorization"></a>
## Documentation for Authorization

<a name="bearerAuth"></a>
### bearerAuth

- **Type**: HTTP Bearer Token authentication (JWT)

