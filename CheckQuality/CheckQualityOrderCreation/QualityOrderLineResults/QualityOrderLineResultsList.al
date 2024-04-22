page 50129 QualityOrderLineResults
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = QualityOrderLineResultsTable;

    layout
    {
        area(Content)
        {
            repeater(QualityOrderLineResults)
            {

                field(ResultsQuantity; rec.ResultsQuantity)
                {
                    ApplicationArea = All;

                }
                field(Outcome; rec.Outcome)
                {
                    ApplicationArea = All;

                }
                field(ResultsValue; rec.ResultsValue)
                {
                    ApplicationArea = All;

                }
                field(IncludeInResult; rec.IncludeInResult)
                {
                    ApplicationArea = All;

                }
                field(Test; rec.Test)
                {
                    ApplicationArea = All;

                }
                field(QualityOrder; rec.QualityOrder)
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

                trigger OnAction()
                begin

                end;
            }
        }
    }
    /*
     var
        SelectedRecord: Record QualityOrderLineResultsTable;
    trigger OnOpenPage()
    begin
        if not SelectedRecord.GET() then
        begin
            Error('Failed to retrieve selected record.');
            exit;
        end;

        // Filter the records based on the selected record
        SetSelectionFilter(SelectedRecord)
    end;
    
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        PurchaseOrderTable: Record "Purchase Header";
        PurchaseLineTable: Record "Purchase Line";
    begin
        BelowxRec := false;
        if PurchaseOrderTable.Get(PurchaseOrderTable."Pay-to Name") then begin
            // Attempt to retrieve the related Purchase Line record
            if PurchaseLineTable.Get(PurchaseLineTable.Type = PurchaseLineTable.Type::Item) then begin
                // Check if the Results Quantity surpasses the Quantity in the Purchase Line
                if (rec.ResultsQuantity > PurchaseLineTable.Quantity) then begin
                    // Display a message and raise an error if the Quantity is surpassed
                    Message('Quantity Surpassed');
                    Error('Quantity Surpassed');
                end
                else begin
                    // Save the record if all validations pass
                    SaveRecord();
                    BelowxRec := true; // Set BelowxRec to true after saving the record
                end;
            end
            else begin
                // Handle cases where the related Purchase Line record cannot be retrieved
                Error('Failed to retrieve related Purchase Line record.');
            end;
        end
        else begin
            // Handle cases where the related Purchase Order record cannot be retrieved
            Error('Failed to retrieve related Purchase Order record.');
        end;
        exit(BelowxRec);
    end;
*/

}