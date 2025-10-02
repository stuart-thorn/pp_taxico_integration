# DefaultApi

All URIs are relative to *https://api.taxico.example.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**bookRidePost**](DefaultApi.md#bookRidePost) | **POST** /bookRide | Initiate a ride booking |
| [**recommendedDepartureTimeGet**](DefaultApi.md#recommendedDepartureTimeGet) | **GET** /recommendedDepartureTime | Recommended pickup time to arrive by target time |
| [**rideBookingsGet**](DefaultApi.md#rideBookingsGet) | **GET** /rideBookings | Find existing ride bookings to a drop-off terminal |
| [**timeToDestinationGet**](DefaultApi.md#timeToDestinationGet) | **GET** /timeToDestination | Travel time to destination for a given departure |


<a name="bookRidePost"></a>
# **bookRidePost**
> BookRideResponse bookRidePost(BookRideRequest)

Initiate a ride booking

    Allows PP app to initiate Taxico booking.

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **BookRideRequest** | [**BookRideRequest**](../Models/BookRideRequest.md)|  | |

### Return type

[**BookRideResponse**](../Models/BookRideResponse.md)

### Authorization

[ApiKeyAuth](../../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

<a name="recommendedDepartureTimeGet"></a>
# **recommendedDepartureTimeGet**
> _recommendedDepartureTime_get_200_response recommendedDepartureTimeGet(arrivalTime, startLat, startLon, destinationLat, destinationLon)

Recommended pickup time to arrive by target time

    Allows PP app to know when a ride should start given specific end time/location.

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **arrivalTime** | **Date**|  | [default to null] |
| **startLat** | **BigDecimal**|  | [default to null] |
| **startLon** | **BigDecimal**|  | [default to null] |
| **destinationLat** | **BigDecimal**|  | [default to null] |
| **destinationLon** | **BigDecimal**|  | [default to null] |

### Return type

[**_recommendedDepartureTime_get_200_response**](../Models/_recommendedDepartureTime_get_200_response.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

<a name="rideBookingsGet"></a>
# **rideBookingsGet**
> List rideBookingsGet(customerId, dropoffLat, dropoffLon, dropoffTime)

Find existing ride bookings to a drop-off terminal

    Allows PP app to check whether a member (via linked Taxico customerId) already has a ride booked to the departure terminal around the given drop-off time. 

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **customerId** | **String**|  | [default to null] |
| **dropoffLat** | **BigDecimal**|  | [default to null] |
| **dropoffLon** | **BigDecimal**|  | [default to null] |
| **dropoffTime** | **Date**|  | [default to null] |

### Return type

[**List**](../Models/RideBooking.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

<a name="timeToDestinationGet"></a>
# **timeToDestinationGet**
> _timeToDestination_get_200_response timeToDestinationGet(departureTime, startLat, startLon, destinationLat, destinationLon)

Travel time to destination for a given departure

    Allows PP app to evaluate how long a journey will take, given a specific start time/location.

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **departureTime** | **Date**|  | [default to null] |
| **startLat** | **BigDecimal**|  | [default to null] |
| **startLon** | **BigDecimal**|  | [default to null] |
| **destinationLat** | **BigDecimal**|  | [default to null] |
| **destinationLon** | **BigDecimal**|  | [default to null] |

### Return type

[**_timeToDestination_get_200_response**](../Models/_timeToDestination_get_200_response.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

