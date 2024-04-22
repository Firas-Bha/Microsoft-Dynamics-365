page 50124 QualityResultsList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = QualityResultsTable;
    DelayedInsert = false;
    CardPageId = "QualityOrderLineResults";


    layout
    {
        area(Content)
        {

            repeater(QualityResults)
            {
                Caption = 'Quality Results';

                field(SequenceNumber; rec.SequenceNumber)
                {
                    Caption = 'Sequence Number';
                    ApplicationArea = All;

                }
                field(TestValue; rec.TestValue)
                {
                    Caption = 'Test Value';
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

                field(AcceptableQuality; rec.AcceptableQuality)
                {
                    Caption = 'Acceptable Quality';
                    ApplicationArea = All;
                    Style = Strong;

                    trigger OnValidate()
var
    Ref: RecordRef;
    TestQuality: Record "TableTests";
begin
        if TestQuality.Get(rec.Test) then
        begin
    // Check if AcceptableQuality is greater than AcceptableQualityLevel
    if (rec.AcceptableQuality > TestQuality.AcceptableQualityLevel) then begin
        rec.TestResult := true;
    end
    // Check if AcceptableQuality falls within the range of MinimumMeasurementValue and MaximumMeasurementValue
    else if (rec.AcceptableQuality >= TestQuality.MinimumMeasurementValue) AND (rec.AcceptableQuality <= TestQuality.MaximumMeasurementValue) then begin
        rec.TestResult := true;
    end
    else begin
        rec.TestResult := false;
    end;
end;
 end;
                }


                field(TestResult; rec.TestResult)
                {
                    Caption = 'Test Result';
                    ApplicationArea = All;
                    Style = Strong;
                    // Editable = false; // If you want to prevent manual editing


                }
                                
                                  field(QualityOrder; rec.QualityOrder)
                                {

                                    Caption = 'Quality Order ';
                                    ApplicationArea = All;
                                    Style = Strong;
                                    //Editable=false;

                                }
                                

            }
            
        }

        area(Factboxes)
        {

        }
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
                PromotedCategory = Process;
                RunObject = page "Select Number Setup";
                trigger OnAction();

                begin

                end;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    var
        Setup: Record "Sequence Number Setup";
        NoMgt: Codeunit NoSeriesManagement;
        Ref: RecordRef;
    begin
        BelowxRec := false;



        Ref.Open(DATABASE::QualityResultsTable);

        if rec.SequenceNumber = '' then begin
            Setup.Get();
            rec.SequenceNumber := NoMgt.GetNextNo(Setup."No.", WORKDATE, true);
        end;

        BelowxRec := true;
        exit(true);
    end;


}
