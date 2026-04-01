package 
{
    import flash.events.*;
    import scaleform.clik.core.*;

    dynamic public class DetailComponent extends UIComponent
    {

        public function DetailComponent()
        {
            addFrameScript(0, this.frame1, 10, this.frame11);
            return;
        }// end function

        public function onOver(event:MouseEvent)
        {
            gotoAndPlay("OVER");
            return;
        }// end function

        public function onOut(event:MouseEvent)
        {
            gotoAndPlay("UP");
            return;
        }// end function

        function frame1()
        {
            stop();
            addEventListener(MouseEvent.ROLL_OVER, this.onOver);
            return;
        }// end function

        function frame11()
        {
            stop();
            addEventListener(MouseEvent.ROLL_OUT, this.onOut);
            return;
        }// end function

    }
}
