table 50134 ItemQualityGroupTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item Number"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";

        }
        field(2; "Quality Group"; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = QualityGroupTable.QualityGroup;
        }
    }

    keys
    {
        key(Key1; "Item Number")
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