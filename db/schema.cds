using {
    Currency,
    cuid,
    managed
} from '@sap/cds/common';

namespace company.cars;

type status : String enum {
    new;
    asigned;
    blocked;
    free;
}

entity CompanyCars : cuid, managed {
    brand     : String;
    model     : String;
    startDate : Date;
    endDate   : Date;
    fuel      : String enum {
        Petrol;
        Diesel;
        Electric;
    };
    power     : Integer;
    powerUnit : String;
    price     : Integer;
    currency  : Currency;
    employee  : Association to Employees;

}

entity Employees {
    key UserID      : Integer;
        firstName   : String;
        lastName    : String;
        fullName    : String;
        companyCode : String;
        jobTitle    : String;
        cars        : Association to many CompanyCars
                          on cars.employee = $self;

}

// value help
define view brand as
    select from CompanyCars distinct {
        key brand
    };
