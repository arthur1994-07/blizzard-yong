package 
{
    import scaleform.clik.controls.*;

    dynamic public class ColorViewBtn extends Button
    {

        public function ColorViewBtn()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 29, this.frame30, 39, this.frame40, 49, this.frame50);
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

        function frame10()
        {
            stop();
            return;
        }// end function

        function frame30()
        {
            gotoAndPlay("over");
            return;
        }// end function

        function frame40()
        {
            stop();
            return;
        }// end function

        function frame50()
        {
            stop();
            return;
        }// end function

    }
}
