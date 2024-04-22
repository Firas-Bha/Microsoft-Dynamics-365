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
                }

                field(Value; rec.Value)
                {
                    Caption = 'Value';
                   
                      ApplicationArea = basic,suite;
                    Importance=Promoted;
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

   if rec.FullBlocking=true then
   begin
    Editable:=false;
    Message('Changes Cannot be Made');
   end;
  
    
end;
  

}



