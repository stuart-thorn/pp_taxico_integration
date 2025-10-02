# Documentation for PP – BFF API

<a name="documentation-for-api-endpoints"></a>
## Documentation for API Endpoints

All URIs are relative to *https://api.pp.example.com/bff/v1*

| Class | Method | HTTP request | Description |
|------------ | ------------- | ------------- | -------------|
| *DefaultApi* | [**bookRidePost**](Apis/DefaultApi.md#bookridepost) | **POST** /bookRide | Proxy to Taxico – book ride |
*DefaultApi* | [**flightBookingsGet**](Apis/DefaultApi.md#flightbookingsget) | **GET** /flightBookings | Proxy to PP Member API – flight bookings for member |
*DefaultApi* | [**recommendedDepartureTimeGet**](Apis/DefaultApi.md#recommendeddeparturetimeget) | **GET** /recommendedDepartureTime | Recommended departure time (buffer added) |
*DefaultApi* | [**rideBookingsGet**](Apis/DefaultApi.md#ridebookingsget) | **GET** /rideBookings | Proxy to Taxico – ride bookings |
*DefaultApi* | [**timeToDestinationGet**](Apis/DefaultApi.md#timetodestinationget) | **GET** /timeToDestination | Time-to-destination (buffer added) |


<a name="documentation-for-models"></a>
## Documentation for Models

 - [_bookRide_post_request](./Models/_bookRide_post_request.md)
 - [_bookRide_post_request_startLocation](./Models/_bookRide_post_request_startLocation.md)
 - [_recommendedDepartureTime_get_200_response](./Models/_recommendedDepartureTime_get_200_response.md)
 - [_timeToDestination_get_200_response](./Models/_timeToDestination_get_200_response.md)


<a name="documentation-for-authorization"></a>
## Documentation for Authorization

<a name="BearerAuth"></a>
### BearerAuth

- **Type**: HTTP Bearer Token authentication (JWT)

