page 50143 "Item Sampling List View"
{
    Editable = false;
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ItemSamlingsTable;
    CardPageId = "ItemSamplingsCard"; 
    layout
    {
        area(Content)
        {
            repeater(ItemSamplings)
            {
                field(ItemSamplingValue; Rec.ItemSamplingValue)
                {
                    ApplicationArea = All;


                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }
                field(SamplingScope; Rec.SamplingScope)
                {
                    ApplicationArea = All;

                }
                field(QuantitySpecification; Rec.QuantitySpecification)
                {
                    ApplicationArea = All;
    


                }
                field(Value; Rec.Value)
                {
                    ApplicationArea = all;
                    
                }
                field(Pourcentage; Rec.Pourcentage)
                {
                    ApplicationArea = all;
                    Editable = false;
   
                    
                }
                field(FullBlocking; Rec.FullBlocking)
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