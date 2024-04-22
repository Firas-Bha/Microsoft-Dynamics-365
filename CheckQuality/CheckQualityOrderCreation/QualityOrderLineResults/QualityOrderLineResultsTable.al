table 50125 QualityOrderLineResultsTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ResultsQuantity; Decimal)
        {
            Caption = 'Results Quantity';
            DataClassification = ToBeClassified;

        }
        field(2; Outcome; Code[20])
        {
            TableRelation = TestVariableOutcomesTable.Outcome;
            DataClassification = ToBeClassified;
        }
        field(3; ResultsValue; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; IncludeInResult; Boolean)
        {
            Caption = 'Include In Result';
            DataClassification = ToBeClassified;
        }
        field(5; Test; Boolean)
        {
            TableRelation=QualityResultsTable.TestResult;
            DataClassification = ToBeClassified;
        }
        field(6; QualityOrder; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation=CheckQualityOrderTable.QualityOrder;
        }
        
         field(7; Name; Text[100])
        {
            TableRelation = CheckQualityOrderTable.name;
            //ValidateTableRelation = false;
            DataClassification = ToBeClassified;
        }
         field(8; "No." ; Code[20])
        {
            TableRelation = "Purchase Line"."No.";
            //ValidateTableRelation = false;
            DataClassification = ToBeClassified;
        }
         field(9; ItemNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Line"."No.";
        }
       
    }

    keys
    {
        key(Key1; "No.")
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