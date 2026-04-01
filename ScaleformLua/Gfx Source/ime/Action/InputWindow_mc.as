package 
{
    import flash.display.*;
    import flash.text.*;

    dynamic public class InputWindow_mc extends MovieClip
    {
        public var readingWindowTextFld:TextField;
        public var inputWindowBackground_mc:MovieClip;

        public function InputWindow_mc()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        function frame1()
        {
            readingWindowTextFld.autoSize = "left";
            return;
        }// end function

    }
}
