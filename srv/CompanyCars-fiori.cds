using CompanyCar as srv from './CompnaCars-srv';

annotate srv.CompanyCars with @(
    // header-level annotations
    // ---------------------------------------------------------------------------
    // List Report
    // ---------------------------------------------------------------------------
    // People List
    UI : {
        TextArrangement     : #TextOnly,
        LineItem            : [
            {
                $Type             : 'UI.DataField',
                Value             : brand,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : model,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : employee_UserID,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : fuel,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : power,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : price,
                ![@UI.Importance] : #High
            }
        ],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : brand}]
        },
        SelectionFields     : [
            brand,
            employee_UserID,
            startDate,
            endDate,
            fuel
        ]
    },
    // ---------------------------------------------------------------------------
    // Object Page
    // ---------------------------------------------------------------------------
    // Page Header
    UI : {
        HeaderInfo              : {
            Title          : {
                $Type : 'UI.DataField',
                Value : brand,
            },
            TypeName       : '{i18n>People}',
            TypeNamePlural : '{i18n>PeopleM}',
            Description    : {Value : employee_UserID}
        },
        HeaderFacets            : [{
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Admin',
            ![@UI.Importance] : #Medium
        }],
        FieldGroup #Description : {Data : [{
            $Type : 'UI.DataField',
            Value : brand,
        }, ]},
        FieldGroup #Details     : {Data : [
            {
                $Type : 'UI.DataField',
                Value : employee_UserID,
            },
            {
                $Type : 'UI.DataField',
                Value : startDate,
            }
        // {
        //     $Type : 'UI.DataField',
        //     Value : endDate,
        // },
        // {
        //     $Type : 'UI.DataField',
        //     Value : ,
        // },
        // {
        //     $Type : 'UI.DataField',
        //     Value : ,
        // },
        // {
        //     $Type : 'UI.DataField',
        //     Value : ,
        // },
        // {
        //     $Type : 'UI.DataField',
        //     Value : ,
        // },
        // {
        //     $Type : 'UI.DataField',
        //     Value : ,
        // }
        ]

        },
        FieldGroup #Admin       : {Data : [
            {
                $Type : 'UI.DataField',
                Value : createdBy
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt
            }
        ]}

    },

);
