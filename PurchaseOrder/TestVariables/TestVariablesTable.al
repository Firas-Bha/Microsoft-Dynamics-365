table 50135 TestVariablesTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Variable; Text[20] )
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Variable)
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