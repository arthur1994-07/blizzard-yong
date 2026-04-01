package 
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MarketButton extends Button
    {
        public var PrivateMarketButtonBG:MovieClip;

        public function MarketButton()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 10, this.frame11, 19, this.frame20, 20, this.frame21, 29, this.frame30, 30, this.frame31, 39, this.frame40);
            return;
        }// end function

        function frame1()
        {
            this.PrivateMarketButtonBG.gotoAndPlay("up");
            return;
        }// end function

        function frame10()
        {
            stop();
            return;
        }// end function

        function frame11()
        {
            this.PrivateMarketButtonBG.gotoAndPlay("over");
            return;
        }// end function

        function frame20()
        {
            stop();
            return;
        }// end function

        function frame21()
        {
            this.PrivateMarketButtonBG.gotoAndPlay("down");
            return;
        }// end function

        function frame30()
        {
            stop();
            return;
        }// end function

        function frame31()
        {
            this.PrivateMarketButtonBG.gotoAndPlay("disabled");
            return;
        }// end function

        function frame40()
        {
            stop();
            return;
        }// end function

    }
}
