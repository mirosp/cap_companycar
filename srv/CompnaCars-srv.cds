using {company.cars as my} from '../db/schema';

service CompanyCar @(path : '/CompanyCar') {

    @odata.draft.enabled : true
    entity CompanyCars as projection on my.CompanyCars;

    @readonly : true
    entity Employees   as projection on my.Employees {
        * , cars : redirected to CompanyCars
    };
    @readonly : true
    entity brands as projection on my.brands;

        // @readonly : true
    // entity Planet          as projection on StarWars.Planet;

    // @readonly : true
    // entity Species         as projection on StarWars.Species;

    // @readonly : true
    // entity Starship        as projection on StarWars.Starship;

    // @readonly : true
    // entity Vehicles        as projection on StarWars.Vehicles;

    // entity Film2People     as projection on StarWars.Film2People {
    //     * , people : redirected to People, 
    // };

    // entity Film2Planets    as projection on StarWars.Film2Planets {
    //     * , film : redirected to Film
    // };

    // entity Film2Starships  as projection on StarWars.Film2Starships {
    //     * , film : redirected to Film
    // };

    // entity Film2Species    as projection on StarWars.Film2Species {
    //     * , film : redirected to Film
    // };

    // entity Film2Vehicles   as projection on StarWars.Film2Vehicles {
    //     * , film : redirected to Film
    // };
}