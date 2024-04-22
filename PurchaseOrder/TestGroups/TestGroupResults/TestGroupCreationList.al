page 50144 TestGroupCreationList
{
    Caption = 'Test Group Records & Results';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TestGroupCreationTable;
    DelayedInsert = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(SequenceNumber; rec.SequenceNumber)
                {
                    Caption = 'Sequence Number';
                    ApplicationArea = All;

                }
                field(Test; rec.Test)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        TestTable: Record TableTests;
                        testgroup: Record TestGroupCreationTable;
                    begin
                        // Initialize TestTable and testgroup records based on your business logic
                        // For example, you might need to find the related records based on certain conditions
                        // Here, we assume that you have found the related records based on rec.Test
                        if TestTable.Get(rec.Test) then begin

                            // Now that the records are initialized, you can access their fields


                            // Perform your checks here
                            if (TestTable.Type = TestTable.Type::Option) AND (rec.TestValue = rec.TestValue::Manual) then begin
                                Message('TestTable.Type: %1, TestGroup.TestValue: %2', TestTable.Type, testgroup.TestValue);
                                // If the conditions are met, show an error message
                                Message('Select another TestValue');
                                Error('Select another Test Value');
                            end
                            else
                                SaveRecord();

                        end;
                    end;

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
                    Caption = 'Test Value';
                    ApplicationArea = All;
                    /*
                     trigger OnValidate()
                     var
                         TestTable: Record TableTests;
                         testgroup: Record TestGroupCreationTable;
                         begin
                          if (TestTable.Type = TestTable.Type::Option) AND (testgroup.TestValue <> testgroup.TestValue::Manual) then 
                          begin
                           Error('Cannot be selected');
                          end;

                     end;
                     /*
                     trigger OnValidate()

                      var
                         TestTable: Record TableTests;
                         testgroup: Record TestGroupCreationTable;
                         begin
         if (TestTable.Type = TestTable.Type::Option) AND (testgroup.TestValue = testgroup.TestValue::Manual) then
         begin
                   Message('Select another Test Value');  
                   BelowxRec:=false;

                   SaveRecord();
         end
         else
         begin

         end;

         end;
 */

                }
                field(Acq; rec.Acq)
                {
                    Visible = false;
                    ApplicationArea = All;

                }
                field(TestGroup; rec.TestGroup)
                {
                    Caption = 'Test Group';
                    ApplicationArea = All;
                    Editable = true;



                }
            }
        }
        /*
        area(Factboxes)
        {
            
        }
        */
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                Caption = 'Select Value for Sequence Number';
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Image = NewItem;
                PromotedCategory=Process;
                RunObject = page "Number Setup";
                trigger OnAction();
                 
                begin

                end;
            }
        }
    }
    var
 myInt: Integer;
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
        var
        Setup: Record "Number Setup";
        NoMgt: Codeunit NoSeriesManagement;
        Ref: RecordRef;
        begin
            BelowxRec := false;

          
   
        Ref.Open(DATABASE::TestGroupCreationTable);

        if rec.SequenceNumber = '' then begin
            Setup.Get();
            rec.SequenceNumber := NoMgt.GetNextNo(Setup."No.", WORKDATE, true);
        end;
          
            BelowxRec := true;
            exit(true);
        end;
    


}





