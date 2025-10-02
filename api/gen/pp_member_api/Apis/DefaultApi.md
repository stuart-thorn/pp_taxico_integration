# DefaultApi

All URIs are relative to *https://member.pp.internal*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**getFlightBookings**](DefaultApi.md#getFlightBookings) | **GET** /flightBookings | Get pending flight bookings for the authenticated member |


<a name="getFlightBookings"></a>
# **getFlightBookings**
> getFlightBookings_200_response getFlightBookings(status, from, to, page, pageSize)

Get pending flight bookings for the authenticated member

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **status** | **String**| Filter by flight booking status | [optional] [default to null] [enum: PENDING, CHECKED_IN, CANCELLED] |
| **from** | **Date**| Earliest departure time (ISO8601) | [optional] [default to null] |
| **to** | **Date**| Latest departure time (ISO8601) | [optional] [default to null] |
| **page** | **Integer**|  | [optional] [default to 1] |
| **pageSize** | **Integer**|  | [optional] [default to 50] |

### Return type

[**getFlightBookings_200_response**](../Models/getFlightBookings_200_response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

