package 
{
    import flash.display.*;

    dynamic public class coolDown extends MovieClip
    {

        public function coolDown()
        {
            addFrameScript(1, this.frame2);
            return;
        }// end function

        function frame2()
        {
            stop();
            return;
        }// end function

    }
}
