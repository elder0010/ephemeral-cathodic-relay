.var page_nr = 0
.var row = 0
.var col = 0 

.const ROWS = 25
.const COLS = 80

.function GoToPage(page_nr){
    print("Going to page " + page_nr);
    .eval page_nr = page_nr
}

.function NextPage(){
    print("Going to next page");
    .eval page_nr = page_nr+1
}

.function NewLine(){
    print("Going to next line");
    .eval row = row+1
    .eval col = 0
}