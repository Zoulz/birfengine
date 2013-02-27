package com.burninghead.utils.math
{
	import com.burninghead.utils.ICloneable;
	import com.burninghead.utils.MathUtil;

	import flash.geom.Point;
	/**
	 * @author tomas.augustinovic
	 */
	public class Line2D implements ICloneable
	{
		private var _p1:Vector2D;
		private var _p2:Vector2D;
		private var _v:Vector2D;
		
		private const _rayOrigTmp:Vector2D = new Vector2D();
		
		public function Line2D(p1:Vector2D, p2:Vector2D)
		{
			_p1 = p1;
			_p2 = p2;
			_v = p2.sub(p1);
		}
		
		public static function fromPoints(p1:Point, p2:Point):Line2D
		{
			return new Line2D(Vector2D.fromPoint(p1), Vector2D.fromPoint(p2));
		}
		
		public function closestPoint(point:Vector2D):Vector2D
		{
	        if (_p1.equals(_p2))
			{
	            return _p1.clone();
			}
			
	        const pointToP1:Vector2D = point.sub(_p1);
	        const a:Number = pointToP1.dot(_v) / _v.lengthSqr;
			
            if (a >= 1.0)
			{
                return _p2.clone();
			}
			else if (a <= 0.0)
			{
	        	return _p1.clone();
			}
			
	        return new Vector2D(
	        	_p2.x * a + _p1.x * (1.0 - a),
	        	_p2.y * a + _p1.y * (1.0 - a));
		}
		
		public function lineIntersectionPoint(line:Line2D):Vector2D
		{
			const perp:Vector2D = line._v.normalLeft();
			const dot:Number = _v.dot(perp);
			
			if (Math.abs(dot) < MathUtil.EPSILON)
			{
				return null;
			}
			
			const p2p:Vector2D = line.p1.sub(_p1);
			const s:Number = p2p.dot(perp) / dot;
			
			if (s < 0 || s > 1)
			{
				return null;
			}
			
			const t:Number = p2p.dot(_v.normalLeft()) / dot;
			
			if (t < 0 || t > 1)
			{
				return null;
			}
			
			return _p1.add(_v.scale(s));
		}
		
		public function lineIntersects(line:Line2D):Boolean
		{
			return ccw(_p1, line._p1, line._p2) != ccw(_p2, line._p1, line._p2) &&
				   ccw(_p1, _p2, line._p1) != ccw(_p1, _p2, line._p2);
		}
		
		public function circleIntersectsPoint(circ:Circle2D):Vector2D
		{
			_rayOrigTmp.copy(_p1);
			_rayOrigTmp.subSelf(circ.pos);
			
			// Quadratics
			// Build coeffs which can be used with std quadratic solver
			// ie t = (-b +/- sqrt(b*b + 4ac)) / 2a
			const a:Number = _v.lengthSqr;
			const b:Number = 2 * _rayOrigTmp.dot(_v);
			const c:Number = _rayOrigTmp.lengthSqr - circ.radius * circ.radius;

			// Calc determinant
			const d:Number = (b*b) - (4 * a * c);
			if (d < 0)
			{
				// No intersection
				return null;
			}
			else
			{
				// BTW, if d=0 there is one intersection, if d > 0 there are 2
				// But we only want the closest one, so that's ok, just use the
				// '-' version of the solver
				const dSqrt:Number = Math.sqrt(d);
				var t:Number = (-b - dSqrt) / (2 * a);
				if (t < 0)
					t = (-b + dSqrt) / (2 * a);
				
				const ip:Vector2D = _v.clone();
				ip.scaleSelf(t);
				ip.addSelf(_p1);
				return ip;
			}
		}
		
		public function circleIntersects(circ:Circle2D):Boolean
		{
			const closestPoint:Vector2D = closestPoint(circ.pos);
			const circleClosestDistSqr:Number = circ.pos.sub(closestPoint).lengthSqr;
			return circleClosestDistSqr <= circ.radius * circ.radius;
		}
		
		public function get dir():Vector2D
		{
			return _v;
		}
		
		public function get p1():Vector2D
		{
			return _p1;
		}
		
		public function get p2():Vector2D
		{
			return _p2;
		}
		
		public function get length():Number
		{
			return _p1.distance(_p2);
		}
		
		private function ccw(a:Vector2D, b:Vector2D, c:Vector2D):Boolean
		{
			return (c.y-a.y) * (b.x-a.x) > (b.y - a.y) * (c.x-a.x);
		}
		
		public function clone():*
		{
			return new Line2D(_p1.clone() as Vector2D, _p2.clone() as Vector2D);
		}
	}
}
