Feature: CAMARA Dedicated Network API, vwip - Areas API Operations
  # Input to be provided by the implementation to the tester
  #
  # Implementation indications:
  # * apiRoot: API root of the server URL
  #
  # Testing assets:
  # * At least one existing area
  #
  # References to OAS spec schemas refer to schemas specified in dedicated-network-areas.yaml

  Background: Common areas setup
    Given an environment at "apiRoot"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" complies with the schema at "#/components/schemas/XCorrelator"

  # Success scenarios for POST /retrieve-service-areas

  @dedicated_network_areas_retrieveServiceAreas_01_success
  Scenario: List all service areas matching the given properties
    Given the resource "/dedicated-network-areas/vwip/retrieve-service-areas"
    And the header "Content-Type" is set to "application/json"
    And the request body is set to a request body compliant with the schema at "/components/schemas/RetrieveServiceAreasRequest"

    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has the same value as the request header "x-correlator"
    And the response body is an array where each item complies with the OAS schema at "/components/schemas/ServiceArea"
    And each item in the response array has properties "id", "area" and optionally properties "description", "networkProfiles", "qosProfiles"

  @dedicated_network_areas_retrieveServiceAreas_02_success_filtered_by_atLocation
  Scenario: List areas filtered by atLocation
    Given a valid atLocation identifier
    And the resource "/dedicated-network-areas/vwip/retrieve-service-areas"
    When the request "RetrieveServiceAreasRequest" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has the same value as the request header "x-correlator"
    And the response body is an array where each item complies with the OAS schema at "/components/schemas/ServiceArea"
    And each item in the response array has properties "id", "area" and optionally properties "description", "networkProfiles", "qosProfiles"

  @dedicated_network_areas_retrieveServiceAreas_03_success_filtered_by_overlappingArea
  Scenario: List areas filtered by overlappingArea
    Given a valid overlappingArea
    And the resource "/dedicated-network-areas/vwip/retrieve-service-areas"
    When the request "RetrieveServiceAreasRequest" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has the same value as the request header "x-correlator"
    And the response body is an array where each item complies with the OAS schema at "/components/schemas/ServiceArea"
    And each item in the response array has properties "id", "area" and optionally properties "description", "networkProfiles", "qosProfiles"

  @dedicated_network_areas_retrieveServiceAreas_04_success_filtered_by_coveringArea
  Scenario: List areas filtered by coveringArea
    Given a valid coveringArea
    And the resource "/dedicated-network-areas/vwip/retrieve-service-areas"
    When the request "RetrieveServiceAreasRequest" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has the same value as the request header "x-correlator"
    And the response body is an array where each item complies with the OAS schema at "/components/schemas/ServiceArea"
    And each item in the response array has properties "id", "area" and optionally properties "description", "networkProfiles", "qosProfiles"

  @dedicated_network_areas_retrieveServiceAreas_05_success_filtered_by_byName
  Scenario: List areas filtered by byName
    Given a valid byName
    And the resource "/dedicated-network-areas/vwip/retrieve-service-areas"
    When the request "RetrieveServiceAreasRequest" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has the same value as the request header "x-correlator"
    And the response body is an array where each item complies with the OAS schema at "/components/schemas/ServiceArea"
    And each item in the response array has properties "id", "area" and optionally properties "description", "networkProfiles", "qosProfiles"

  @dedicated_network_areas_retrieveServiceAreas_06_success_filtered_by_byNetworkProfileId
  Scenario: List areas filtered by byNetworkProfileId
    Given a valid byNetworkProfileId
    And the resource "/dedicated-network-areas/vwip/retrieve-service-areas"
    When the request "RetrieveServiceAreasRequest" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has the same value as the request header "x-correlator"
    And the response body is an array where each item complies with the OAS schema at "/components/schemas/ServiceArea"
    And each item in the response array has properties "id", "area" and optionally properties "description", "networkProfiles", "qosProfiles"

  @dedicated_network_areas_retrieveServiceAreas_06_success_filtered_by_byQosProfileName
  Scenario: List areas filtered by byQosProfileName
    Given a valid byQosProfileName
    And the resource "/dedicated-network-areas/vwip/retrieve-service-areas"
    When the request "RetrieveServiceAreasRequest" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has the same value as the request header "x-correlator"
    And the response body is an array where each item complies with the OAS schema at "/components/schemas/ServiceArea"
    And each item in the response array has properties "id", "area" and optionally properties "description", "networkProfiles", "qosProfiles"

  # Success scenarios for GET /areas/{areaId}

  @dedicated_network_areas_readServiceAreas_01_success
  Scenario: Get details of a specific service area
    Given an existing service area
    And the resource "/dedicated-network-areas/vwip/areas/{areaId}"
    And the path parameter "areaId" is set to the ID of the existing service area
    When the request "readServiceArea" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has the same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/ServiceArea"
    And the response property "$.id" is equal to the path parameter "areaId"
    And the response property "$.area" exists and complies with the OAS schema at "/components/schemas/Area"
    And the one of the response properties "$.networkProfiles" or "$.qosProfiles" exists.
    When the response property "$.networkProfiles" exists then it is a non-empty array where each item complies with the OAS schema at "/components/schemas/NetworkProfileId"
    When the response property "$.qosProfiles" exists then it is a non-empty array where each item complies with the OAS schema at "/components/schemas/QosProfileName"
