table 50123 QualityResultsTable
{
    DataClassification = ToBeClassified;
    
    fields
    {
         field(1; SequenceNumber;Code[20])
        {
            DataClassification = ToBeClassified;
            

        }
        field(2; TestValue; Enum TestValue)
        {
            DataClassification = ToBeClassified;
        }
        field(3; Test; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = TableTests.Test;
        }
        field(4; TestResult; Boolean)
        {
            
            DataClassification = ToBeClassified;  
        }
        field(5; AcceptableQuality ; Decimal )
        {
            DataClassification = ToBeClassified;
        }
        field(6; QualityOrder; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = CheckQualityOrderTable.QualityOrder;
            //TableRelation = "No. Series".Code;
        }
        /*
         field(20; CertificateOfAnalysis; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement=true;

        }
        field(19; CreatedBy; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18; CreatedDateAndTime; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(17; Description; Text[20])
        {
            DataClassification = ToBeClassified;
        }
       
        field(16; Quantity; Decimal)
        {
            TableRelation = CheckQualityOrderTable.Quantity;
            DataClassification = ToBeClassified;
        }
        field(8; ItemNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = ItemQualityGroupTable."Item Number";
        }
        field(9; Site; Text[20])
        {
            TableRelation = CheckQualityOrderTable.Site;
            DataClassification = ToBeClassified;
        }
        field(10; Warehouse; Text[20])
        {
            TableRelation = CheckQualityOrderTable.Warehouse;
            DataClassification = ToBeClassified;
        }
        field(11; Status; Enum Status)
        {
            TableRelation = CheckQualityOrderTable.Status;
            DataClassification = ToBeClassified;
        }
         field(12; ReferenceType; Code[20])
        {
            TableRelation = CheckQualityOrderTable.ReferenceType;
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(13; AccountSelection; Code[20])
        {
            TableRelation = CheckQualityOrderTable.AccountSelection;
            DataClassification = ToBeClassified;
        }
        field(14; AccountName; Text[100])
        {
            TableRelation = CheckQualityOrderTable.AccountName;
            DataClassification = ToBeClassified;
            // TableRelation = Vendor.name;
        }
        field(15; ReferenceNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = CheckQualityOrderTable.ReferenceNumber;
        }
 

      
        /*
        field(6; AcceptableQualityRelatedToTest; Decimal)
        {
            DataClassification = ToBeClassified;
            TableRelation=TableTests.AcceptableQualityLevel;
        }
        */
        /*
          field(6; TestGroup; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = TestGroupTable.TestGroup;
        }
        */
       
    
    
    }
    
    keys
    {
        key(Key1; SequenceNumber)
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