table 50136 TestVariableOutcomesTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Outcome; Code[20])
        {
            DataClassification = ToBeClassified;

        }

        field(2; Description; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; OutcomeStatus; Enum OutcomeStatus)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Variable; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation=TestVariablesTable.Variable;
            Editable=true;
        }
    }

    keys
    {
        key(Key1; Outcome)
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
enum 50136 OutcomeStatus
{
    Extensible = true;

    value(0; Pass) { Caption = 'Pass'; }
    value(1; Fail) { Caption = 'Fail'; }


}
