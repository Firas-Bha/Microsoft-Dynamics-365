table 50124 CertificateOfAnalysisTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(15; SequenceNumber; Code[20])
        {
           
            DataClassification = ToBeClassified;
        }
        field(1; CertificateOfAnalysis; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; ItemNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = ItemQualityGroupTable."Item Number";
        }
        field(3; AccountSelection; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(4; CreatedBy; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; CreatedDateAndTime; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(6; Site; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Warehouse; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Description; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Test; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = QualityResultsTable.Test;
        }
        field(10; ReferenceType; Code[20])
        {
            TableRelation = CheckQualityOrderTable.ReferenceType;
            DataClassification = ToBeClassified;
        }
        field(11; ReferenceNumber; Code[20])
        {
            TableRelation = CheckQualityOrderTable.ReferenceNumber;
            DataClassification = ToBeClassified;
        }
        field(12; Status; Enum Status)
        {
            TableRelation = QualityResultsTable.TestResult;
            DataClassification = ToBeClassified;
        }
        field(13; QualityOrder; Code[100])
        {
            TableRelation = CheckQualityOrderTable.QualityOrder;
            DataClassification = ToBeClassified;
        }
        field(14; Quantity; Decimal)
        {
            TableRelation = CheckQualityOrderTable.Quantity;
            DataClassification = ToBeClassified;
        }
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

    trigger OnInsert()
    begin
        CreatedDateAndTime := CurrentDateTime()
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