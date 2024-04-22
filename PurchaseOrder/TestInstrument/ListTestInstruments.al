page 50134 TestInstumentSetup
{
    Caption = 'Test Instrument Setup';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = TestInstrument;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(TestInstrument; rec."TestInstrument")
                {
                    Caption = 'Test Instrument';
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Unit; rec.Unit)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        PrecisionCalculation: Codeunit "Precision_Calculation";
                        CalculatedPrecision: Decimal;
                    begin
                        // Call the CalculatePrecision method and store the result
                        CalculatedPrecision := PrecisionCalculation.CalculatePrecision(rec.Unit);

                        // Assign the calculated precision to the rec.Precision field
                        rec.Precision := CalculatedPrecision;
                    end;


                }
                field(Precision; rec.Precision)
                {
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
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }

  

}

codeunit 50102 "Precision_Calculation"
{
    var
        PrecisionCalculation: Codeunit "Precision_Calculation";

    procedure CalculatePrecision(Unit: Enum Unit): Decimal
    var
        Precision: Decimal;
    begin
        case Unit of
            Unit::Gram:
                Precision := 0.01000;
            Unit::Hz:
                Precision := 0.10000;
            else
                Precision := 0;
        end;
        exit(Precision);
    end;
}

