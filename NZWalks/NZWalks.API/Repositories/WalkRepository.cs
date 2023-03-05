using Microsoft.EntityFrameworkCore;
using NZWalks.API.Data;
using NZWalks.API.Models.Domain;

namespace NZWalks.API.Repositories
{
    public class WalkRepository : IWalkRepository
    {
        private readonly NZWalksDbContext nZWalksDbContext;

        public WalkRepository(NZWalksDbContext nZWalksDbContext)
        {
            this.nZWalksDbContext = nZWalksDbContext;
        }

        public async Task<Walk> AddAsync(Walk walk)
        {
            //dont want to assign id from client
            walk.Id = Guid.NewGuid();
            await nZWalksDbContext.Walks.AddAsync(walk);
            await nZWalksDbContext.SaveChangesAsync();
            return walk;
        }

        public async Task<Walk> DeleteAsync(Guid id)
        {
            var walk= await nZWalksDbContext.Walks.FindAsync(id);
            if (walk == null)
            {
                return null;
            }
            nZWalksDbContext.Walks.Remove(walk);
            await nZWalksDbContext.SaveChangesAsync();
            return walk;
        }

        public async Task<IEnumerable<Walk>> GetAllAync()
        {
            return await nZWalksDbContext.Walks
            #region Nevagation Prop
                //We can Include nevigation prop using Include()
            #endregion
                .Include(x => x.Region)
                .Include(x => x.WalkDifficulty)
                .ToListAsync();
        }

        public Task<Walk> GetAync(Guid id)
        {
            return nZWalksDbContext.Walks
                .Include(x=> x.Region)
                .Include(x=> x.WalkDifficulty)
                .FirstOrDefaultAsync(x=> x.Id == id);   
        }

        public async Task<Walk> UpdateAsync(Guid id, Walk walk)
        {
            //feth walk from db
            var existingWalk = await nZWalksDbContext.Walks.FindAsync(id);

            if(existingWalk == null)
            {
                return null;
            }
            //updates from incomming walk
            existingWalk.Length = walk.Length;
            existingWalk.Name = walk.Name;
            existingWalk.WalkDifficultyId = walk.WalkDifficultyId;
            existingWalk.RegionId = walk.RegionId;
            await nZWalksDbContext.SaveChangesAsync();
            return existingWalk;

        }


    }
}
