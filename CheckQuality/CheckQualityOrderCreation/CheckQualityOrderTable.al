table 50120 CheckQualityOrderTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(20; Code; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement=true; 
            TableRelation= QualityOrderLineResultsTable.Code;   

        }
        field(1; ReferenceType; Code[20])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(19; "No."; code[20])
        {
            TableRelation = "Purchase Header"."No.";
          //  ValidateTableRelation = false;
            DataClassification = ToBeClassified;
        }
        /*
         field(20; "No."; code[20])
        {
            TableRelation = "Purchase Header"."No.";
            ValidateTableRelation = false;
            DataClassification = ToBeClassified;
            
        }
        */
        
        field(2; AccountSelection; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(7; AccountName; Text[100])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Vendor.name;
        }
        field(3; ReferenceNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Order Entity Buffer";

        }
        field(4; QualityOrder; Code[100])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "No. Series".Code;
        }
        field(5; TestGroup; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = TestGroupTable.TestGroup;
        }
        /*
        field(6; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        */
        field(8; ItemNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = ItemQualityGroupTable."Item Number";
        }
        field(9; Site; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Warehouse; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Status; Enum Status)
        {
            DataClassification = ToBeClassified;
        }
         field(12; Quantityy;Decimal)
        {
            Caption='Quantity Value';
            DataClassification = ToBeClassified;
            TableRelation= "ItemSamlingsTable".value;
            ValidateTableRelation=false;
        }
        
        /*
        field(12; CertificateOfAnalysis; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;

        }
        */
        field(13; CreatedBy; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14; CreatedDateAndTime; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(15; Description; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16; Test; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = QualityResultsTable.Test;
        }

        field(17; TestResult; Boolean)
        {
            TableRelation = QualityResultsTable.TestResult;
            DataClassification = ToBeClassified;

        }


        field(18; SequenceNumber; Code[20])
        {
            DataClassification = ToBeClassified;


        }
        field(21; CertificateOfAnalysis; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(22; "Total Quantity"; Decimal)
        {
            //Caption = 'Results Value';
            TableRelation=QualityOrderLineResultsTable."Total Quantity";
        }

        /*
        field(13; TestValue; Enum TestValue)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Test; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = TableTests.Test;
        }
        field(15; TestResult; Boolean)
        {
            
            DataClassification = ToBeClassified;  
        }
        field(16; AcceptableQuality ; Decimal )
        {
            DataClassification = ToBeClassified;
        }
        */
    }

    keys
    {
        key(Key1; QualityOrder)
        {
            Clustered = true;
        }
       
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    trigger OnInsert()
    begin
        CreatedDateAndTime := CurrentDateTime()
    end;


}


enum 50133 Status
{
    Extensible = true;

    value(0; Open) { Caption = 'Open'; }
    value(1; Pass) { Caption = 'Pass'; }
    value(2; Fail) { Caption = 'Fail'; }

}