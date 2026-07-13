let config = {
  address: "localhost",
  port: 8080,
  basePath: "/",

  ipWhitelist: ["127.0.0.1", "::ffff:127.0.0.1", "::1"],

  useHttps: false,
  httpsPrivateKey: "",
  httpsCertificate: "",

  language: "pt-br",
  locale: "pt-BR",
  timeFormat: 24,
  units: "metric",

  modules: [
    {
      module: "alert"
    },

    {
      module: "updatenotification",
      position: "top_bar"
    },

    {
      module: "clock",
      position: "top_center",
      config: {
        displaySeconds: true,
        showPeriod: false,
        showPeriodUpper: false,
        showDate: true,
        dateFormat: "dddd, D [de] MMMM [de] YYYY"
      }
    },

    {
      module: "calendar",
      header: "📅 Calendário",
      position: "bottom_left",
      config: {
        maximumEntries: 6,
        maximumNumberOfDays: 30,
        displaySymbol: true,
        calendars: [
          {
            symbol: "calendar-check",
            url: "https://www.calendarlabs.com/ical-calendar/ics/33/Brazil_Holidays.ics"
          }
        ]
      }
    },

    {
      module: "weather",
      position: "top_left",
      header: "🌤️ Rolante - RS",
      config: {
        weatherProvider: "openmeteo",
        type: "current",
        lat: -29.6506,
        lon: -50.5758
      }
    },

    {
      module: "weather",
      position: "top_right",
      header: "📆 Previsão do Tempo",
      config: {
        weatherProvider: "openmeteo",
        type: "forecast",
        lat: -29.6506,
        lon: -50.5758
      }
    },

    {
      module: "newsfeed",
      position: "bottom_bar",
      config: {
        feeds: [
          {
            title: "Notícias",
            url: "https://g1.globo.com/rss/g1/rs/rio-grande-do-sul/"
          }
        ],
        showSourceTitle: true,
        showPublishDate: true,
        broadcastNewsFeeds: true,
        broadcastNewsUpdates: true
      }
    }
  ]
};

/*************** DO NOT EDIT THE LINE BELOW ***************/
if (typeof module !== "undefined") {
  module.exports = config;
}