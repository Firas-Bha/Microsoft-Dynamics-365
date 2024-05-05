table 50125 QualityOrderLineResultsTable
{
    DataClassification = ToBeClassified;
    DrillDownPageID = "QualityOrderLineResults";
    LookupPageID = "QualityOrderLineResults";

    fields
    {
        field(1; ResultsQuantity; Decimal)
        {
            Caption = 'Results Quantity';
            DataClassification = ToBeClassified;

        }
        field(7; Code; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement=true;    

        }
        field(2; Outcome; Code[20])
        {
            TableRelation = TestVariableOutcomesTable.Outcome;
            DataClassification = ToBeClassified;
        }
        /*
        field(3; ResultsValue; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        */
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
        
        field(10; "Total Quantity"; Decimal)
        {
            //Caption = 'Results Value';
            DecimalPlaces = 0 : 5;
            CalcFormula = sum("QualityOrderLineResultsTable".ResultsQuantity where("QualityOrder" = field("QualityOrder")));
            Editable = false;
            FieldClass = FlowField;
            
        }
        /*
        field(11; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
            TableRelation=CheckQualityOrderTable.Quantity;
        }
        */
         field(12; ItemSamplingValue;Decimal)
        {
            Caption='Item Sampling Value';
            TableRelation=CheckQualityOrderTable.Quantityy;
            DataClassification = ToBeClassified;
           
        }
        field(13; TestResultString; text[100])
        {
            DataClassification = ToBeClassified;
        }
          field(14; "SumQuantity"; Decimal)
        {    //Caption = 'Total Quantity';
            //Caption = 'Results Value';
            DataClassification=ToBeClassified;
           // Editable=false;
        
            
        }
        /*
         field(7; Name; Text[100])
        {
            TableRelation = CheckQualityOrderTable.name;
            //ValidateTableRelation = false;
            DataClassification = ToBeClassified;
        }
        
         field(8; No ; Code[20])
        {
            TableRelation = ItemQualityGroupTable."Item Number";
            DataClassification = ToBeClassified;
           // ValidateTableRelation = false;
        }
        */
        /*
         field(9; ItemNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Line"."No.";
        }*/
       
    }

    keys
    {
        key(Key1; Code )
        {
            Clustered = true;
        }
       
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
       no: code[20];

    

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