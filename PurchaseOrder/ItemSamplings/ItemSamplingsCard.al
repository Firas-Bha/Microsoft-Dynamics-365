page 50138 ItemSamplingsCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ItemSamlingsTable;
    Caption = 'Item Sampling';
    AboutTitle = 'About Item Sampling';


    layout
    {
        area(Content)
        {
            group(ItemSamplings)
            {
                Caption = 'Item Samplings';

                // Fields related to Item Samplings
                field(ItemSampling; rec.ItemSamplingValue)
                {
                    Caption = 'Item Sampling';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        if xrec.ItemSamplingValue = rec.ItemSamplingValue then
                            Message('Value already inserted');

                    end;

                }

                field(Description; rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                }

                field(SamplingScope; rec.SamplingScope)
                {
                    Caption = 'Sampling Scope';

                    Editable = false;
                    ApplicationArea = All;
                }
            }
            // Group for Sampling Quantity
            group(SamplingQuantity)
            {
                Caption = 'Sampling Quantity';

                field(QuantitySpecification; rec.QuantitySpecification)
                {
                    Caption = 'Quantity Specification';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                       
                    begin
                        
                    end;
                }
                
                field(Pourcentage; Rec.Pourcentage)
                {
                    ApplicationArea = All;
                   
                                    Editable = false;
                    trigger OnValidate()
                    var
        EditableCurrCode: Boolean;
begin
    // Check if the QuantitySpecification is set to "Fixed"
    if rec.QuantitySpecification = rec.QuantitySpecification::FixedQuantity then
    begin
        // Set the Editable property of the Pourcentage field to false
       EditableCurrCode := true;
    end;
end;
                }
                field("Specified Value"; rec."Specified Value")
{
    ApplicationArea = All;
    Editable = true;

    trigger OnValidate()
    var
        OriginalValue: Decimal;
        Percentage: Decimal;
        NewValue: Decimal;
    begin
        // Assuming OriginalValue and Percentage are assigned elsewhere
        OriginalValue := rec."Specified Value";
        Percentage := rec.Pourcentage;
        if rec.QuantitySpecification = rec.QuantitySpecification::VariableQuantity then
        begin
            // Call the function to calculate the new value after applying the percentage decrease
            NewValue := CalculateValueAfterPercentageDecrease(OriginalValue, Percentage);
            // Assign the calculated value to the specified value field
            rec.Value := NewValue;
            
            // Now you can use the NewValue as needed
            Message('New value after applying percentage decrease: %1', NewValue);
        end;
    end;
}
                field(Value; rec.Value)
                {
                    Caption = 'Value';
                    Editable=false;
                    ApplicationArea = basic, suite;
                    Importance = Promoted;

                }

            }

            // Group for Process
            group(Process)
            {
                Caption = 'Process';

                field(FullBlocking; rec.FullBlocking)
                {
                    Caption = 'Full Blocking';


                }
            }

        }
    }


    actions
    {
        area(Promoted)
        {

            actionref(p1; "Test Groups") { }
            actionref(p2; "ItemSamplingList") { }
        }
        area(Processing)
        {
            action(ItemSamplingList)
            {
                Caption = 'Item Sampling List View';
                ApplicationArea = All;
                Image = ListPage;
                RunObject = page "Item Sampling List View";
                trigger OnAction()
                begin

                end;
            }
            action("Test Groups")
            {
                Caption = 'Test Group Setup';
                ApplicationArea = All;
                Image = Setup;
                RunObject = page "TestGroupPageList";
                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;

    trigger OnAfterGetCurrRecord()
    var

        OrderScope: Code[20];
        MyCardPage: Page "ItemSamplingsCard";
    begin
        OrderScope := 'Order';
        rec.SamplingScope := OrderScope;

    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        RecordInserted: Boolean;
    begin
        // Your logic here
        RecordInserted := true;

        // Ensure that the record can be inserted
        exit(true);
    end;

    trigger OnOpenPage()
    begin

        if rec.FullBlocking = true then begin
            Editable := false;
            Message('Changes Cannot be Made');
        end;


    end;
procedure CalculateValueAfterPercentageDecrease(OriginalValue: Decimal; Percentage: Decimal): Decimal
var
    NewValue: Decimal;
begin
    NewValue := OriginalValue * ( Percentage / 100);
    exit(NewValue);
end;

}



