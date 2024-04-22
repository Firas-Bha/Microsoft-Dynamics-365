page 50146 TestGroupCreationPage
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TestGroupCreationTable;
    Editable=true;

    layout
    {
        area(Content)
        {
            repeater(Setup)
            {
                /*
                field(TestGroup; rec.TestGroup)
                {
                    Caption = 'Test Group';
                    ApplicationArea = All;
                    Editable = false;
                    


                }
                */
                field(SequenceNumber; rec.SequenceNumber)
                {
                    Caption='Sequence Number';
                    ApplicationArea = All;

                }
                field(Test; rec.Test)
                {
                    ApplicationArea = All;
                    

                }
                field(Effective; rec.Effective)
                {
                    ApplicationArea = All;

                }
                field(Expiration; rec.Expiration)
                {
                    ApplicationArea = All;

                }
                field(TestValue; rec.TestValue)
                {
                    Caption='Test Value';
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Value)
            {
                
                
                trigger OnAction()
                begin
                    
                end;
            }
            
        }
    }

trigger OnInsertRecord(BelowxRec: Boolean): Boolean
var
    myInt: Integer;
    TestTable: Record TableTests;
    testgroup: Record TestGroupCreationTable;
begin
    BelowxRec := true;
    Message('TestTable.Type: %1, TestGroup.TestValue: %2', TestTable.Type, testgroup.TestValue);

    // Assuming you have found the related records, perform your checks
    if (TestTable.Type = TestTable.Type::Option) AND (testgroup.TestValue <> testgroup.TestValue::Manual) then
    begin
        // If the conditions are met, show an error message and prevent insertion
        Error('Select another Test Value');
        BelowxRec := false;
    end
    else
    begin
        // Debugging: Output a message to confirm the condition is not met
        Message('Condition is not met. Record will be inserted.');
    end;

    // Return the value of BelowxRec to indicate whether the record can be inserted
    exit(BelowxRec);
end;

}