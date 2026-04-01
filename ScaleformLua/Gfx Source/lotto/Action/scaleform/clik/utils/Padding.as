package scaleform.clik.utils
{

    public class Padding extends Object
    {
        public var top:Number = 0;
        public var bottom:Number = 0;
        public var left:Number = 0;
        public var right:Number = 0;

        public function Padding(... args)
        {
            switch(args.length)
            {
                case 0:
                {
                    break;
                }
                case 1:
                {
                    args = Number(args[0]);
                    this.left = args;
                    var _loc_2:* = args;
                    this.bottom = args;
                    this.right = _loc_2;
                    this.top = _loc_2;
                    break;
                }
                case 2:
                {
                    var _loc_2:* = Number(args[0]);
                    this.bottom = Number(args[0]);
                    this.top = _loc_2;
                    var _loc_2:* = Number(args[1]);
                    this.left = Number(args[1]);
                    this.right = _loc_2;
                    break;
                }
                case 4:
                {
                    this.top = Number(args[0]);
                    this.right = Number(args[1]);
                    this.bottom = Number(args[2]);
                    this.left = Number(args[3]);
                    break;
                }
                default:
                {
                    throw new Error("Padding can not have " + args.length + " values");
                    break;
                }
            }
            return;
        }// end function

        public function get vertical() : Number
        {
            return this.top + this.bottom;
        }// end function

        public function get horizontal() : Number
        {
            return this.left + this.right;
        }// end function

        public function toString() : String
        {
            return "[Padding top=" + this.top + " bottom=" + this.bottom + " left=" + this.left + " right=" + this.right + "]";
        }// end function

    }
}
