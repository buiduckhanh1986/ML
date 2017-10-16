function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%


old_val = zeros(size(X,1), 1);

for i = 1:K
	val = sum((bsxfun(@minus,X,centroids(i,:)).^2), 2);
	
	if (i == 1)
		idx = idx + i;
		
		old_val = val;
	else
		compare = old_val < val;
		
		idx = idx.*compare - (compare - 1) * i;
		
		old_val = old_val.*compare - (compare - 1) .* val;
	end
	
	
end

%for i = 1:size(X,1)
%   [_, idx(i)] = min(sum(bsxfun(@minus,X(i,:),centroids).^2,2));
%end






% =============================================================

end

