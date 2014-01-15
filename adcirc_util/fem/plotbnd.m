function retval=plotbnd(fem_grid_struct,varargin)
%PLOTBND plot boundary of FEM mesh
%   PLOTBND(fem_grid_struct) draws the boundary of 
%   an input FEM domain.  
%
%   PLOTBND can also be used to draw the boundary of a transect.
%   The boundary list can be generated by passing DETBNDY 
%   the transect node coordinates and the element list for
%   the transect.  Then, pass PLOTBND the same node coordinates
%   and the boundary list returned from DETBNDY.
%  
%   INPUT : fem_grid_struct (from LOADGRID, see FEM_GRID_STRUCT)
%           standard LINE parameter/value pairs can be passed in.
%
%  OUTPUT : hboun - handle to boundary object drawn
%
%    CALL : hboun=plotbnd(fem_grid_struct,p1,v1,...)
%
% Written by : Brian O. Blanton
% Summer 1997
%

% added varargin, 28 Jun 02, BOB

%if nargin ~=1 
%   error('    Incorrect number of input arguments to PLOTBND');
%end

if ~is_valid_struct(fem_grid_struct)
   error('    Argument to PLOTBND must be a valid fem_grid_struct.')
end

% Extract grid fields from fem_grid_struct
%
bnd=fem_grid_struct.bnd;
x=fem_grid_struct.x;
y=fem_grid_struct.y;

ns=bnd(:,1);
ne=bnd(:,2);
X=[x(ns) x(ne) NaN*ones(size(ns))]';
Y=[y(ns) y(ne) NaN*ones(size(ns))]';
X=X(:);
Y=Y(:);
hboun=line(X,Y,'Tag','boundary','Color','k',varargin{:});
           
if nargout==1,retval=hboun;,end
%
%LabSig  Brian O. Blanton
%        Department of Marine Sciences
%        12-7 Venable Hall
%        CB# 3300
%        University of North Carolina
%        Chapel Hill, NC
%                 27599-3300
%
%        brian_blanton@unc.edu
%
%        Summer 1997
%
