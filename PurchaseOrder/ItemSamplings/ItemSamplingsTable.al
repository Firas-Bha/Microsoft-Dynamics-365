table 50139 ItemSamlingsTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ItemSamplingValue; code[20])
        {
            DataClassification = ToBeClassified;
           
        }

        field(2; Description; Text[30])
        {
            DataClassification = ToBeClassified;
            
        }

        field(3; SamplingScope; Text[20])
        {
            Caption = 'Order';
            DataClassification = ToBeClassified;
            
            
        }

        field(4; QuantitySpecification; Enum QuantitySpecification)
        {
            Caption = 'Quantity Specification';
            DataClassification = ToBeClassified;
            
        }

        field(5; Value; Decimal)
        {
            DataClassification = ToBeClassified;
            
        }


        field(6; FullBlocking; Boolean)
        {
            Caption = 'Full Blocking';
            

        }

    }

    keys
    {
        key(Key1; ItemSamplingValue)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;



}

enum 50137 QuantitySpecification
{
    Extensible = true;

    value(0; FixedQuantity) { Caption = 'Fixed Quantity'; }
    value(1; VariableQuantity) { Caption = 'Variable Quantity'; }

}