# Documentation for Taxico – Journey &amp; Booking API

<a name="documentation-for-api-endpoints"></a>
## Documentation for API Endpoints

All URIs are relative to *https://api.taxico.example.com*

| Class | Method | HTTP request | Description |
|------------ | ------------- | ------------- | -------------|
| *DefaultApi* | [**bookRidePost**](Apis/DefaultApi.md#bookridepost) | **POST** /bookRide | Initiate a ride booking |
*DefaultApi* | [**recommendedDepartureTimeGet**](Apis/DefaultApi.md#recommendeddeparturetimeget) | **GET** /recommendedDepartureTime | Recommended pickup time to arrive by target time |
*DefaultApi* | [**rideBookingsGet**](Apis/DefaultApi.md#ridebookingsget) | **GET** /rideBookings | Find existing ride bookings to a drop-off terminal |
*DefaultApi* | [**timeToDestinationGet**](Apis/DefaultApi.md#timetodestinationget) | **GET** /timeToDestination | Travel time to destination for a given departure |


<a name="documentation-for-models"></a>
## Documentation for Models

 - [BookRideRequest](Models/BookRideRequest.md)
 - [BookRideResponse](Models/BookRideResponse.md)
 - [LatLon](Models/LatLon.md)
 - [RideBooking](Models/RideBooking.md)
 - [_recommendedDepartureTime_get_200_response](taxico/Models/_recommendedDepartureTime_get_200_response.md)
 - [_timeToDestination_get_200_response](taxico/Models/_timeToDestination_get_200_response.md)


<a name="documentation-for-authorization"></a>
## Documentation for Authorization

<a name="ApiKeyAuth"></a>
### ApiKeyAuth

- **Type**: API key
- **API key parameter name**: X-API-Key
- **Location**: HTTP header

