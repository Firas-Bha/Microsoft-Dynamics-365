page 50133 "Tests Setup"
{
    Caption = 'Tests Setup';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = TableTests;



    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Test; Rec.Test)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }

                field(TestInstrument; Rec.TestInstrument)
                {
                    Caption = 'Test Instrument';
                    ApplicationArea = All;
                }
                field(Unit; rec.Unit)
                {
                    ApplicationArea = All;
                    Editable = rec.Type <> rec.Type::Option;
                }
                field(AcceptableQualityLevel; rec.AcceptableQualityLevel)
                {
                    Caption='Acceptable Quality Level';
                    ApplicationArea = All;

                }
                field(MinimumMeasurementValue; rec.MinimumMeasurementValue)
                {
                    Caption='Minimum Measurement Value';
                    ApplicationArea = All;

                }
                field(MaximumMeasurementValue; rec.MaximumMeasurementValue)
                {
                    Caption='Maximum Measurement Value';
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Creation)
        {
            group(Tests)
            {
                Caption = 'Tests';
                action(TestVariableNewLineCreation)
                {

                    ApplicationArea = All;
                    Caption = 'Test Variables new line creation';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    image = TestReport;
                    trigger OnAction();
                    var
                        NewLine: page "TestVariableNewLineCreation";
                    begin
                        NewLine.Run();
                    end;
                }
                action(TestVariableOutcomeAddition)
                {
                    ApplicationArea = All;
                    Caption = 'Test Variables outcomes addition';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    image = VariableList;
                    trigger OnAction()
                    var
                        Outcome: page "PageOutcomeAddition";
                    begin
                        Outcome.Run();
                    end;
                }

            }



        }
    }
}