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
};

entity CompanyCars : cuid, managed {
    plateNumber : String;
    brand       : String;
    model       : String;
    startDate   : Date;
    endDate     : Date;
    fuel        : String enum {
        Petrol;
        Diesel;
        Electric;
    };
    power       : Integer;
    powerUnit   : String;
    price       : Integer;
    currency    : Currency;
    employee    : Association to Employees;

}

annotate CompanyCars with @(
    title              : '{i18n>CompanyCar}',
    UI.TextArrangement : #TextOnly,
    cds.odata.valuelist,
    Common.SemanticKey : [plateNumber],
    UI.Identification  : [{
        $Type : 'UI.DataField',
        Value : plateNumber

    }, ]
) {
    // ID         @(
    //     Core.Computed,
    //     Common.Text : {
    //         $value                 : ,
    //         ![@UI.TextArrangement] : #TextOnly
    //     }
    // );
    // plateNumber       @(
    //     title                           : '{i18n>}',
    //     Common.ValueListWithFixedValues : false,
    //     Common.ValueList                : {
    //         CollectionPath : 'People',
    //         Parameters     : [{
    //             $Type             : 'Common.ValueListParameterInOut',
    //             LocalDataProperty : 'name',
    //             ValueListProperty : 'name'
    //         }]
    //     }
    // );

    brand     @(
        title                           : '{i18n>brand}',
        Common.ValueListWithFixedValues : false,
        Common.ValueList                : {
            CollectionPath : 'brands',
            Parameters     : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'brand',
                ValueListProperty : 'brand'
            }]
        }
    );
    model     @title : '{i18n>model}';
    startDate @(
        title                 : '{i18n>startDate}',
        // common.IsCalendarDate : true
    );
    endDate   @(
        title                 : '{i18n>endDate}',
        // common.IsCalendarDate : true
    );
    fuel      @title : '{i18n>fuel}';
    power     @(
        title                        : '{i18n>power}',
        Common.UnitSpecificPrecision : 'powerUnit'
    );
    powerUnit @(
        title         : '{i18n>powerUnit}',
        Common.IsUnit : true
    );
    price     @(
        title                        : '{i18n>price}',
        Common.UnitSpecificPrecision : 'currency',
    );
    currency  @(
        title             : '{i18n>currency}',
        Common.IsCurrency : true
    );

// employee  @(
//     title            : '{i18n>homeworld}',
//     Common.Text      : {
//         $value                 : homeworld.name,
//         ![@UI.TextArrangement] : #TextOnly
//     },
//     Common.ValueList : {
//         CollectionPath  : 'Planet',
//         SearchSupported : true,
//         Parameters      : [
//             {
//                 $Type             : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : 'homeworld_ID',
//                 ValueListProperty : 'ID'
//             },
//             {
//                 $Type             : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'name'
//             },
//             {
//                 $Type             : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'climate'
//             },
//             {
//                 $Type             : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'terrain'
//             },
//             {
//                 $Type             : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'population'
//             }
//         ]
//     }
// );
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
define view brands as
    select from CompanyCars distinct {
        key brand
    };
