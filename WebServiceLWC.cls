public class WebServiceLWC {
 
    @AuraEnabled (cacheable=true)
    public static WeatherData performCallout(String location) {
        WeatherData w;
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Weather?q=' + location + '&appid=4de9d90c988ef183377602453bf1e65c');
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        if(res.getStatusCode() == 200 && String.isNotBlank(res.getBody())){
            w = (WeatherData)JSON.deserialize(res.getBody(), WeatherData.class);
        }
        return w;
    }

    public class WeatherData {
        @AuraEnabled public String name;
        @AuraEnabled public Coordintes coord;
        @AuraEnabled public List<Weather> weather;
        @AuraEnabled public Main main;
        @AuraEnabled public Wind wind;
    }

    public class Coordintes {
        @AuraEnabled public Double lat;
        @AuraEnabled public Double lon;
    }

    public class Weather {
        @AuraEnabled public String main;
        @AuraEnabled public String description;
    }

    public class Main {
        @AuraEnabled public Double temp;
        @AuraEnabled public String feels_like;
        @AuraEnabled public Double pressure;
        @AuraEnabled public Double humidity;
    }

    public class Wind {
        @AuraEnabled public Double speed;
    }
}