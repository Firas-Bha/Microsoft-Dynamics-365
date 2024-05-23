page 50124 QualityResultsList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = QualityResultsTable;
    DelayedInsert = false;
    // CardPageId = "QualityOrderLineResults";


    layout
    {
        area(Content)
        {

            repeater(QualityResults)
            {
                Caption = 'Quality Results';

                field(QualityOrder; rec.QualityOrder)
                {

                    Caption = 'Quality Order ';
                    ApplicationArea = All;
                    Style = Strong;

                    //Editable=false;
                    trigger OnValidate()
                    var
                        TotalQualityOrder: Decimal;
                        PassQuantity: Decimal;
                        AcceptableLevel: Decimal;
                        init: Decimal;
                        "QualityOrderLineResults": Record "QualityOrderLineResultsTable";
                        "CheckQualityOrderTable": Record "CheckQualityOrderTable";
                        MyRecord2: Record "QualityResultsTable";

                    begin

                        //Message('Number of lines  %1',rec."NOL");      
                    end;

                }

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
                        TestQuality: Record "TableTests";
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
                        rec.NOL := rec."Number Of Lines";
                        CalculateAcceptableLevel(rec.AcceptableQuality);
                        SaveRecord();
                         TestQuality.SetFilter(test,rec.Test);
                        if TestQuality.FindLast() then begin
                            // Check if AcceptableQuality is greater than AcceptableQualityLevel
                            if (rec.AcceptableQuality > TestQuality.AcceptableQualityLevel) then begin
                               // Message('acceptable quality is %1 and test quality is %2 ', rec.AcceptableQuality, TestQuality.AcceptableQualityLevel);
                                rec.TestResult := true;
                                rec.Modify();
                                SaveRecord();
                            end
                            // Check if AcceptableQuality falls within the range of MinimumMeasurementValue and MaximumMeasurementValue
                            else if (rec.AcceptableQuality >= TestQuality.MinimumMeasurementValue) AND (rec.AcceptableQuality <= TestQuality.MaximumMeasurementValue) then begin
                                rec.TestResult := true;
                                 rec.Modify();
                                SaveRecord();
                            end
                            else begin
                                rec.TestResult := false;
                              //  Message('ok');
                            end;
                        end;
                    
                    end;

                }




                field(TestValue; rec.TestValue)
                {
                    Caption = 'Test Value';
                    ApplicationArea = All;

                }


                field(AcceptableQuality; rec.AcceptableQuality)
                {
                    Caption = 'Acceptable Quality';
                    ApplicationArea = All;
                    Style = Strong;
                    Editable = false;

                    trigger OnValidate()
                    var
                        Ref: RecordRef;
                        TestQuality: Record "TableTests";
                    begin
                        /*
                        TestQuality.SetFilter(test,rec.Test);
                        if TestQuality.FindLast() then begin
                            // Check if AcceptableQuality is greater than AcceptableQualityLevel
                            if (rec.AcceptableQuality > TestQuality.AcceptableQualityLevel) then begin
                                Message('acceptable quality is %1 and test quality is %2 ', rec.AcceptableQuality, TestQuality.AcceptableQualityLevel);
                                rec.TestResult := true;
                                rec.Modify();
                                SaveRecord();
                            end
                            // Check if AcceptableQuality falls within the range of MinimumMeasurementValue and MaximumMeasurementValue
                            else if (rec.AcceptableQuality >= TestQuality.MinimumMeasurementValue) AND (rec.AcceptableQuality <= TestQuality.MaximumMeasurementValue) then begin
                                rec.TestResult := true;
                                 rec.Modify();
                                SaveRecord();
                            end
                            else begin
                                rec.TestResult := false;
                                Message('ok');
                            end;
                        end;
                        */
                    end;
                    
                }


                field(TestResult; rec.TestResult)
                {
                    Caption = 'Test Result';
                    ApplicationArea = All;
                    Style = Strong;
                    Editable = false; // If you want to prevent manual editing
                }


                field("Number Of Lines"; rec."Number Of Lines")
                {
                    Caption = 'Number Of Lines';
                    ApplicationArea = All;
                    //Visible = false;
                }
                field("nol"; rec."nol")
                {
                    Caption = 'nol';
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
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
        TotalQualityOrder: Decimal;
        PassQuantity: Decimal;
        AcceptableLevel: Decimal;
        "QualityOrderLineResults": Record "QualityOrderLineResultsTable";
        MyRecord2: Record "QualityResultsTable";
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

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        Lines: Integer;
        nol: Decimal;
        MyRecord2: Record "QualityResultsTable";
    begin
        BelowxRec := false;

        BelowxRec := true;


    end;


    local procedure CalculateAcceptableLevel(AcceptableQuality: Decimal): Decimal
    var
        TotalQualityOrder: Decimal;
        PassQuantity: Decimal;
        AcceptableLevel: Decimal;
        TotalQualityOrderAccepted: Integer;
        "QualityOrder": Record "QualityOrderLineResultsTable";
        "CheckQualityOrderTable": Record "CheckQualityOrderTable";
        "QualityOrderResults": Record "QualityResultsTable";
    begin
        // Initialize TotalQualityOrder
        TotalQualityOrder := 0;

        // Filter QualityOrder records by the current QualityOrder
        QualityOrder.SetFilter(QualityOrder, rec.QualityOrder);

        // Loop through QualityOrder records
        if QualityOrder.FindFirst() then begin
            repeat
                // Check if the outcome is ACCEPTED
                if ("QualityOrder".Outcome = 'ACCEPTED') then begin
                    // Increment TotalQualityOrder for each accepted outcome
                    TotalQualityOrder += 1;
                    //Message('Number accepted: %1', TotalQualityOrder);
                end;
            until QualityOrder.Next() = 0;
        end;

        // Update TotalQualityOrderPass
        rec.TotalQualityOrderPass := TotalQualityOrder;

        // Calculate AcceptableQuality
        if rec.NOL <> 0 then
            rec.AcceptableQuality := rec.TotalQualityOrderPass / rec.NOL;

        // Return AcceptableQuality
        exit(rec.AcceptableQuality);

    end;



    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        rec.NOL := rec."Number Of Lines";

    end;


}
