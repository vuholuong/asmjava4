package Inteface;

import java.util.List;

import Model.Share;

public interface ShareDAO extends GenericDAO<Share, Long>{
	public List<Object[]> getSharesPerMonth();
	public void addShare(Share share);
}
