# DefaultApi

All URIs are relative to *https://api.pp.example.com/mem/v1*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**flightBookingsMemberGet**](DefaultApi.md#flightBookingsMemberGet) | **GET** /flightBookings/member | Get member&#39;s flight bookings |
| [**flightBookingsTaxiCoClientGet**](DefaultApi.md#flightBookingsTaxiCoClientGet) | **GET** /flightBookings/taxiCoClient | Get bookings by Taxico customer ID |


<a name="flightBookingsMemberGet"></a>
# **flightBookingsMemberGet**
> _flightBookings_member_get_200_response flightBookingsMemberGet(memberId)

Get member&#39;s flight bookings

    Allows PP app to retrieve member&#39;s flight bookings.

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **memberId** | **String**|  | [default to null] |

### Return type

[**_flightBookings_member_get_200_response**](../Models/_flightBookings_member_get_200_response.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

<a name="flightBookingsTaxiCoClientGet"></a>
# **flightBookingsTaxiCoClientGet**
> _flightBookings_taxiCoClient_get_200_response flightBookingsTaxiCoClientGet(taxiCoCustomerId)

Get bookings by Taxico customer ID

    Allows Taxico app to retrieve Taxico customer&#39;s flight bookings.

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **taxiCoCustomerId** | **String**|  | [default to null] |

### Return type

[**_flightBookings_taxiCoClient_get_200_response**](../Models/_flightBookings_taxiCoClient_get_200_response.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

