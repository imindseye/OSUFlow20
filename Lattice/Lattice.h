
#ifndef _LATTICE_H_
#define _LATTICE_H_ 
    
#include<stdio.h>
#include<stdlib.h>

#include "header.h"
#include "calc_subvolume.h"
#include "VectorMatrix.h" 
#include "OSUFlow.h"

#ifdef MPI
#include <mpi.h>
#endif

struct LatPartition {
  int NumSendPoints[6]; // number of points ready to send
  int SizeSendPoints[6]; // size of sending points list (bytes)
  float *SendPoints[6]; // sending points list
  int NumRecvPoints[6]; // number of points received
  int SizeRecvPoints[6]; // size of receiving points list (bytes)
  float *RecvPoints[6]; // receiving points list
  int Proc; // process(or) number (mpi rank, core number, node number, etc.)
};

class  Lattice {

 public: 
  
  Lattice(int xlen, int ylen, int zlen, int min_t, int max_t, int ghost, int np); 
  ~Lattice(); 
  int GetRank(int i, int j, int k);        // serach by lattice indices
  int GetRank(float x, float y, float z);  //search by physical location
  void GetNeighborRanks(int myrank, int *neighbor_ranks);
  int GetIndices(int rank, int &i, int &j, int&k);  // search by rank 
  int GetIndices(float x, float y, float z, int& iidx, int &jidx, int&kidx);  // search by physical locations
  int GetBounds(int i, int j, int k, volume_bounds_type& vb);  //return bound  by latticr indices 
  int GetBounds(int rank, volume_bounds_type& vb);   // return bound  by rank 
  volume_bounds_type* GetBoundsList(){ return vb_list;}
  void GetLatticeDims(int& i, int&j, int &k) {i = idim; j=jdim; k=kdim; }
  bool isIn(float, float, float, int, int, int); // is position [x,y,z] in lattice element [i,j,k]? 
  int CheckNeighbor(int myrank, float x, float y, float z); // which of my neighbor has [x,y,z] by rank? 
  int GetNeighbor(int myrank, float x, float y, float z, int &i, int &j, int &k); // which of my neighbor has [x,y,z] by indices
  int GetProc(int, int, int);  // how is different from GetRank? 
  int GetProc(int); 
  void InitSeedLists(); 
  void ResetSeedLists(); 
  void ClearSeedList(int rank); 
  void InsertSeed(int, int, int, VECTOR4); 
  void RoundRobin_proc(int n); 
  void GetPartitions(int, int**, int&); 
  void GetPartitions(int, int*, int&); 
  void PrintPost(int myrank);
  void PrintRecv(int myrank);
  void PostPoint(int myrank, VECTOR4 p, int neighbor);
  int GetNumRecv(int myrank);
  void GetRecvPts(int myrank, VECTOR4 *ls);

  list<VECTOR4> *seedlists; 

 private: 

  int idim, jdim, kdim; //the lattice range
  int xdim, ydim, zdim; //the data range
  int tmin, tmax; // time range 
  int npart; 
  volume_bounds_type *vb_list; 
  LatPartition *parts; // list of partition information
  void Error(const char *fmt, ...);

  // MPI functions

#ifdef MPI

 public:

  void SendNeighbors(int myrank, MPI_Comm comm);
  int ReceiveNeighbors(int myarank, MPI_Comm comm);

#endif

}; 

#endif 
