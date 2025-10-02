# DefaultApi

All URIs are relative to *https://api.pp.example.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**bookRide**](DefaultApi.md#bookRide) | **POST** /bookRide | Submit a taxi booking request linked to a flight |
| [**getBookingsList**](DefaultApi.md#getBookingsList) | **GET** /bookingsList | Get list of pending flights with related taxi data |
| [**getRideDetails**](DefaultApi.md#getRideDetails) | **GET** /rideDetails | Get ride details and journey timing for a flight |


<a name="bookRide"></a>
# **bookRide**
> BookRideResponse bookRide(BookRideRequest)

Submit a taxi booking request linked to a flight

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **BookRideRequest** | [**BookRideRequest**](../Models/BookRideRequest.md)|  | |

### Return type

[**BookRideResponse**](../Models/BookRideResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

<a name="getBookingsList"></a>
# **getBookingsList**
> getBookingsList_200_response getBookingsList(page, pageSize)

Get list of pending flights with related taxi data

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **page** | **Integer**|  | [optional] [default to 1] |
| **pageSize** | **Integer**|  | [optional] [default to 20] |

### Return type

[**getBookingsList_200_response**](../Models/getBookingsList_200_response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

<a name="getRideDetails"></a>
# **getRideDetails**
> RideDetailsResponse getRideDetails(flightId, lat, lon)

Get ride details and journey timing for a flight

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **flightId** | **String**|  | [default to null] |
| **lat** | **Double**| Member’s current latitude | [default to null] |
| **lon** | **Double**| Member’s current longitude | [default to null] |

### Return type

[**RideDetailsResponse**](../Models/RideDetailsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

