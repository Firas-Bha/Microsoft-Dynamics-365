table 50144 TestGroupCreationTable
{
    DataClassification = ToBeClassified;


    fields
    {
        /*
        field(8; SequenceValue; code[20])
        {
            DataClassification = ToBeClassified;
        }
        */

        field(1; SequenceNumber;Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Test; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = TableTests.Test;
        }
        field(3; Effective; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Expiration; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(5; TestValue; Enum TestValue)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Acq; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; TestGroup; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = TestGroupTable.TestGroup;
        }
        /*
        field(6; Attribute; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(7; UpdateInventoryBatchAttribute; Blob)
        {
            DataClassification = ToBeClassified;
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
        /*
   trigger OnInsert()
    var
        Setup: Record "Number Setup";
        NoMgt: Codeunit NoSeriesManagement;
        Ref: RecordRef;
    begin
        Ref.Open(DATABASE::TestGroupCreationTable);

        if SequenceNumber = '' then begin
            Setup.Get();
            SequenceNumber := NoMgt.GetNextNo(Setup."No.", WORKDATE, true);
        end;
    end;
*/





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
enum 50138 TestValue
{
    Extensible = true;

    value(0; Maximum) { Caption = 'Maximum'; }
    value(1; Minimum) { Caption = 'Minimum'; }
    value(2; Average) { Caption = 'Average'; }
    value(3; Manual) { Caption = 'Manual'; }



}



