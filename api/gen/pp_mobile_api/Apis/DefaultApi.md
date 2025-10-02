# DefaultApi

All URIs are relative to *https://api.pp.example.com/bff/v1*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**bookRidePost**](DefaultApi.md#bookRidePost) | **POST** /bookRide | Proxy to Taxico – book ride |
| [**flightBookingsGet**](DefaultApi.md#flightBookingsGet) | **GET** /flightBookings | Proxy to PP Member API – flight bookings for member |
| [**recommendedDepartureTimeGet**](DefaultApi.md#recommendedDepartureTimeGet) | **GET** /recommendedDepartureTime | Recommended departure time (buffer added) |
| [**rideBookingsGet**](DefaultApi.md#rideBookingsGet) | **GET** /rideBookings | Proxy to Taxico – ride bookings |
| [**timeToDestinationGet**](DefaultApi.md#timeToDestinationGet) | **GET** /timeToDestination | Time-to-destination (buffer added) |


<a name="bookRidePost"></a>
# **bookRidePost**
> bookRidePost(\_bookRide\_post\_request)

Proxy to Taxico – book ride

    Proxies &#x60;Taxico /bookRide&#x60;.

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **\_bookRide\_post\_request** | [**_bookRide_post_request**](../Models/_bookRide_post_request.md)|  | |

### Return type

null (empty response body)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

<a name="flightBookingsGet"></a>
# **flightBookingsGet**
> flightBookingsGet(memberId)

Proxy to PP Member API – flight bookings for member

    Proxies &#x60;PP Member API /flightBookings/member&#x60; with the same query parameters.

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **memberId** | **String**|  | [default to null] |

### Return type

null (empty response body)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

<a name="recommendedDepartureTimeGet"></a>
# **recommendedDepartureTimeGet**
> _recommendedDepartureTime_get_200_response recommendedDepartureTimeGet(memberId, terminalId, arrivalTime, startLat, startLon, destinationLat, destinationLon)

Recommended departure time (buffer added)

    Compute pickup time to arrive by the target time. Uses PP member data (buffer, terminal), and proxies Taxico &#x60;/recommendedDepartureTime&#x60;. The returned &#x60;departureTime&#x60; includes the PP buffer. 

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **memberId** | **String**|  | [default to null] |
| **terminalId** | **String**|  | [default to null] |
| **arrivalTime** | **Date**|  | [default to null] |
| **startLat** | **BigDecimal**|  | [default to null] |
| **startLon** | **BigDecimal**|  | [default to null] |
| **destinationLat** | **BigDecimal**|  | [default to null] |
| **destinationLon** | **BigDecimal**|  | [default to null] |

### Return type

[**_recommendedDepartureTime_get_200_response**](../Models/_recommendedDepartureTime_get_200_response.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

<a name="rideBookingsGet"></a>
# **rideBookingsGet**
> rideBookingsGet(customerId, dropoffLat, dropoffLon, dropoffTime)

Proxy to Taxico – ride bookings

    Proxies &#x60;Taxico /rideBookings&#x60;.

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **customerId** | **String**|  | [default to null] |
| **dropoffLat** | **BigDecimal**|  | [default to null] |
| **dropoffLon** | **BigDecimal**|  | [default to null] |
| **dropoffTime** | **Date**|  | [default to null] |

### Return type

null (empty response body)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

<a name="timeToDestinationGet"></a>
# **timeToDestinationGet**
> _timeToDestination_get_200_response timeToDestinationGet(memberId, terminalId, departureTime, startLat, startLon, destinationLat, destinationLon)

Time-to-destination (buffer added)

    Evaluate journey given a departure time. Proxies Taxico &#x60;/timeToDestination&#x60;, and returns a **buffer-inclusive** &#x60;departureTime&#x60; (same input departureTime if already includes buffer). 

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **memberId** | **String**|  | [default to null] |
| **terminalId** | **String**|  | [default to null] |
| **departureTime** | **Date**|  | [default to null] |
| **startLat** | **BigDecimal**|  | [default to null] |
| **startLon** | **BigDecimal**|  | [default to null] |
| **destinationLat** | **BigDecimal**|  | [default to null] |
| **destinationLon** | **BigDecimal**|  | [default to null] |

### Return type

[**_timeToDestination_get_200_response**](../Models/_timeToDestination_get_200_response.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

