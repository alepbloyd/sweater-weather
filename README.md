# README

## Intro

This is a Rails API application, completed as a project for Turing School of Software and Design's Backend Module 3, and requirements for the project can be found here: [Whether, Sweater?](https://backend.turing.edu/module3/projects/sweater_weather/)

This program demonstrates consuming external APIs, synthesizing the information accessed, and exposing API endpoints to return the synthesized information in a consistent JSON format.

In addition, this program demostrates user creation and authentication via `bcrypt`, and generates API keys for use in accessing the `road-trip` endpoint. 

Users can fetch the weather forecast for a search location, or create a 'roadtrip', showing the travel time from one location to another and the weather forecast for the arrival point at arrival time. 

## Setup

To begin, clone this program to your machine, and run:

`$ bundle`

to update and install gems and dependencies. 

## API Keys

This project relies on the use of two external APIs that require user registration to obtain keys - Mapquest and OpenWeather's 'One Call API'.

- [MapQuest Developer Sign-up](https://developer.mapquest.com/user/login/sign-up)
- [OpenWeather API Sign-up](https://openweathermap.org/api)

Once you have registered and have your API keys, set up Figaro by running this terminal command:

`$ bundle exec figaro install`

And then add your keys into the generated `application.yml` file:

```
mapquest_api: your_mapquest_api_key
openweather_api: your_openweather_api_key
```

## API Endpoints

### `GET /api/v1/forecast?location={{search_location}}`

Returns current weather, daily forecasts for the next five days, and hourly forecasts for the next eight hours in format:

```json
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "30 September 2022",
        "sunrise": "8:00 AM",
        "sunset": "9:00 PM",
        "temp": 55.5,
        "feels_like": 60.2,
        "humidity": 4,
        "uvi": 2,
        "visibility": 10000,
        "conditions": "partly cloudy",
        "icon": "04d",
      },
      "daily_weather": [
        {
          "date": "31 September 2022",
          "sunrise": "5:00 AM",
          "sunset": "5:00 PM",
          "max_temp": 100.2,
          "min_temp": 25.5,
          "conditions": "pretty wild out there",
          "icon": "04d"
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "9:00 PM",
          "conditions": "cloudy with a chance of meatballs",
          "temp": 44.2,
          "icon": "04d"
        },
        {...} etc
      ]
    }
  }
}

```

### `POST /api/v1/users`

Accepts JSON request of email, password, and password confirmation. Returns user and a generated API key if successful in format:

```json
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

### `POST /api/v1/road_trip`

Accepts JSON request including origin, destination, and a valid API key in format: 

```json
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```