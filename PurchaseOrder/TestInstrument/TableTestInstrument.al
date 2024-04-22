table 50132 TestInstrument
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; TestInstrument; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Unit; Enum Unit)
        {
            DataClassification = ToBeClassified;

        }
        field(4; Precision; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; TestInstrument)
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

