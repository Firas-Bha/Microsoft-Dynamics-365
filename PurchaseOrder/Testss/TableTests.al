table 50130 TableTests
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Test; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Type; Enum Type)
        {
            DataClassification = ToBeClassified;
        }

        field(4; TestInstrument; Text[20])
        {
            Caption='Test Instrument';
            DataClassification = ToBeClassified;
            TableRelation =TestInstrument.TestInstrument;
        }

        field(5; Unit; Enum Unit)
        {
            DataClassification = ToBeClassified;
        }
        field(6; AcceptableQualityLevel; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(7; MinimumMeasurementValue; Decimal)
        {
            
            DataClassification = ToBeClassified;
        }
        field(8; MaximumMeasurementValue; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(Key1; Test)
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

enum 50131 Type
{
    Extensible = true;

    value(0; Fraction) { Caption = 'Fraction'; }
    value(1; Integer) { Caption = 'Integer'; }
    value(2; Option) { Caption = 'Option'; }

}
enum 50132 Unit
{
    Extensible = true;

    value(0; Option)
    {
        Caption = 'Option';
    }
    value(1; Ohm)
    {
        Caption = 'Ohm';
    }
    value(2; Hz)
    {
        Caption = 'Hz';
    }
    value(3; Gram)
    {
        Caption = 'Gram';
    }
}