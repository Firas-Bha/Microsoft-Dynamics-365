table 50112 WorkerResponsibleTable
{
    DataClassification = ToBeClassified;
    DrillDownPageID = "WorkerResponsiblePage";
    LookupPageID = "WorkerResponsiblePage";
    
    
    fields
    {
        field(1;Worker; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation= Employee."No.";
            
        }
        field(2; WorkerResponsible; Code[20])
        {
            Caption='Worker Responsible';
            DataClassification = ToBeClassified;
            TableRelation=Employee;
             
            
        }
    }
    
    keys
    {
        key(Key1; Worker)
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}